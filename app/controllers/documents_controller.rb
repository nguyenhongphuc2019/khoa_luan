class DocumentsController < ApplicationController
  before_action :load_document, only: %i(show)
  
  def index
    @documents = Verb.find_by(id: params[:verb_id]).documents
    @keywords_category = Verb.order(id: :asc).limit(10)
  end
  
  def show
    category_id = @document.category_id
    @relation_documents = Document.where(category_id: category_id).limit(10)
  end

  private

  def load_document
    @document = Document.find_by id: params[:id]
  end
end
