class DocumentsController < ApplicationController
  before_action :load_category, only: %i(show)
  
  def show
    category_id = @document.category_id
    @relation_documents = Document.where(category_id: category_id).limit(10)
  end

  private

  def load_category
    @document = Document.find_by id: params[:id]
  end
end
