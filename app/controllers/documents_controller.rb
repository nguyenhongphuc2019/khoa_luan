class DocumentsController < ApplicationController
  before_action :load_category, only: %i(show)
  
  def show
  end

  private

  def load_category
    @document = Document.find_by id: params[:id]
  end
end
