class DocumentsLikedController < ApplicationController
  def index
    @likeds = current_user.likes.includes :document
  end
end