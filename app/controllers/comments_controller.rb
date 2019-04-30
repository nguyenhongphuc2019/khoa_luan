class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params.merge(user_id: current_user.id))
    if comment.save
      flash[:success] = "Cám ơn bạn đã để lại bình luận cho tài liệu này!!"
    end
    redirect_to document_path(comment.document)  
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      flash[:error] = "Bạn đã xóa bình luận của mình về tài liệu này thành công!!!"
    end
    redirect_to document_path(comment.document)
  end

  private

  def comment_params
    params.permit(:document_id, :content)
  end
end