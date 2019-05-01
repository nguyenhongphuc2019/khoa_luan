class UserUploadDocumentsController < ApplicationController
  def index
    document_ids = UserUploadDocument.where(user_id: current_user.id).pluck :document_id
    @documents = Document.where id: document_ids
  end
end