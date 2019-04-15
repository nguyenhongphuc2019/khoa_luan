class StaticPagesController < ApplicationController
  before_action :check_age
  def index
    if feature_attributes_user.present?
      suggest_document
      keyword_recommend
    else
      @documents_recomend = Document.order(created_at: :asc).limit(6)
      $keywords_category = Verb.limit 20
    end
    tracking_documents
  end

  private

  def feature_attributes_user
    FeatureAttributesUser.find_by(user_id: current_user.id) if user_signed_in?
  end

  def keyword_recommend
    category_ids = []
    @documents_recomend.each do |document|
      category_ids << document.category.parent_id
    end
    $keywords_category = Verb.where(group: category_ids)
  end

  def suggest_document
    if user_signed_in?
      fa_user = FeatureAttributesUser.find_by(user_id: current_user.id)
      mapping_attr_user = FeatureUserDocument.where(gender: check_gender, generation: check_age, status: current_user.state).pluck :document_id
      mapping_category = FeatureCategoriesDocument.where(main_major: current_user.main_major).pluck :document_id
      mapping_user = (mapping_attr_user + mapping_category).uniq
      @documents_recomend = Document.where(id: mapping_user)
    else
      @documents_recomend = Document.order(created_at: :desc).limit(10)
    end
  end

  def tracking_documents
    if user_signed_in?
      document_trackings = DocumentTracking.where(user_id: current_user.id).pluck :document_id
      @doc_trackings = Document.where id: document_trackings
    end
  end

  def check_gender
    current_user.gender == "2"? "Fermale" : "Male"
  end

  def check_age
    if user_signed_in? and age.present?
      if  age < 30
        return "Young"
      elsif (30 < age) and (age < 40)
        return "Middle"
      elsif  (40 < age) and (age < 60)
        return "Old" 
      end
    end
  end

  def age
    current_year - current_user.birth_day if user_signed_in? and current_user.birth_day.present?
  end

  def current_year
    Date.current.year
  end
end
