class CategoriesController < ApplicationController
  before_action :load_category, only: %i(show)
  
  def show
    @documents = @category.documents.page(params[:page]).per(6)
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
  end
end