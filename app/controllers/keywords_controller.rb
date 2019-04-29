class KeywordsController < ApplicationController
  def index
    @keywords = Verb.all
    render json: @keywords
  end
end