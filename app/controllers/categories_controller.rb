class CategoriesController < ApplicationController
  before_action :load_category, only: %i(show)
  
  def show
  end

  private

  def load_category
    @category = Category.find_by params[:id]
  end
end