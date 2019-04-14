class DocumentsController < ApplicationController
  before_action :load_document, only: %i(show update destroy edit)

  def new
    @document = Document.new
  end
  
  def index
    @documents = Document.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def show
    category_id = @document.category_id
    @relation_documents = Document.where(category_id: category_id).limit(10)
  end

  def create
    @document = Document.new document_params
    if @document.save
      redirect_to @document
      UserUploadDocument.create(user_id: current_user.id, document_id: Document.last.id)
    else
      render :new
    end
  end

  def update
    if @document.update document_params
      redirect_to @document
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    uploader = UserUploadDocument.find_by(user_id: current_user, document_id: @document.id)
    uploader.destroy
    @document.destroy
    redirect_to user_upload_documents_path 
  end

  private

  def load_document
    @document = Document.find_by id: params[:id]
  end

  def document_params
    params.require(:document).permit(:category_id, :source_file,
      :image, :name, :author_name, :language_id, :description)
  end
end
