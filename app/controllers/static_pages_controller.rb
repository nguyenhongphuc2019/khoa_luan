class StaticPagesController < ApplicationController
  def index
    @keywords_category = Verb.order(id: :desc).limit(20)
  end
end
