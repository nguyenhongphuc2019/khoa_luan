class StaticPagesController < ApplicationController
  def index
    @keywords_category = Verb.order(id: :desc).limit 20
    suggest_document
    tracking_documents
  end

  private

  def suggest_document
    features_user = current_user.features.pluck :id
    features_document = FeatureDocument.where(feature_id: features_user).pluck :document_id
    @document_recomend = Document.where id: features_document
  end

  def tracking_documents
    document_trackings = DocumentTracking.where(user_id: current_user.id).pluck :document_id
    @doc_trackings = Document.where id: document_trackings
  end
end
