class StaticPagesController < ApplicationController
  def index
    @keywords_category = Verb.order(id: :desc).limit 20
    # suggest_document
    tracking_documents
  end

  private

  def suggest_document
    if user_signed_in?
      features_user = current_user.features.pluck :id 
      features_document = FeatureUserDocument.where(feature_id: features_user).pluck :document_id
      @document_recomend = Document.where id: features_document
    end
  end

  def tracking_documents
    if user_signed_in?
      document_trackings = DocumentTracking.where(user_id: current_user.id).pluck :document_id
      @doc_trackings = Document.where id: document_trackings
      
    end
  end 
end
