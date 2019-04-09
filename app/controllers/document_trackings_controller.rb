class DocumentTrackingsController < ApplicationController

  def create
    @document_tracking = DocumentTracking.new params_document_tracking
    if @document_tracking.save
      render json: :ok
    end  
  end

  private

  def params_document_tracking
    params.permit(:user_id, :document_id)
  end
end