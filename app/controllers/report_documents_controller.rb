class ReportDocumentsController < ApplicationController

  def create
    report = ReportDocument.new document_id: params[:document_id], user_id: current_user.id
    document = Document.find_by(id: params[:document_id])
    if report.save
      flash[:success] = "Cám ơn bạn đã báo cáo vi phạm của tài liệu `#{document.name}`."
    end
  end

  def destroy
    report = ReportDocument.find_by id: params[:id]
    document = Document.find_by id: params[:document_id]
    if report.destroy
      flash[:error] = "Bạn đã hủy báo cáo tài liệu `#{document.name}` thành công."
    end
  end
end