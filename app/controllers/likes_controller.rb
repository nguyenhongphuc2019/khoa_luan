class LikesController < ApplicationController

  def create
    like = Like.new(document_id: params[:document_id], user_id: current_user.id)
    document = Document.find_by(id: params[:document_id])
    if like.save
      flash[:success] = "Tài liệu #{document.name} đã được thêm vào mục tài liệu yêu thích của bạn"
    end
  end

  def destroy
    like = Like.find_by id: params[:id]
    document = Document.find_by id: params[:document_id]
    if like.destroy
      flash[:error] = "Tài liệu #{document.name} đã bị xóa khỏi mục tài liệu yêu thích của bạn"
    end
  end
end