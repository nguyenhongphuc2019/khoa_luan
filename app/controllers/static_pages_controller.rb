class StaticPagesController < ApplicationController
  before_action :check_age
  def index
    suggest_document
    load_keyword
    tracking_documents
  end

  private

  def load_keyword
    if user_signed_in? 
      category_ids = []
      @documents_recomend.each do |document|
        category_ids << document.category.parent_id
      end
      @keywords_category = Verb.where(group: category_ids)
    else
      @keywords_category = Verb.order(id: :desc).limit 20
    end
  end

  def suggest_document
    if user_signed_in?
      fa_user = FeatureAttributesUser.find_by(user_id: current_user.id)
      mapping_user = FeatureUserDocument.where(gender: check_gender, generation: check_age, status: fa_user.state).pluck :document_id
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
    current_user.gender == 2? "Male" : "Fermale"
  end

  def check_age
    if user_signed_in?
      if  age < 30
        return "Young"
      elsif 30 < age < 40
        return "Middle"
      elsif  40 < age < 60
        return "Old" 
      end
    end
  end

  def age
    current_year - current_user.birth_day if user_signed_in?
  end

  def current_year
    Date.current.year
  end
end
