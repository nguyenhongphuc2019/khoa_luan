class Document < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable counter_cache: :true, column_name: :total_view, unique: :request_hash
  belongs_to :category
  belongs_to :language
  mount_uploader :source_file, SourceFileUploader, dependent: :destroy
  mount_uploader :image, ImageUploader, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :document_trackings, dependent: :destroy
  has_many :feature_user_documents, dependent: :destroy
  has_many :feature_categories_documents, dependent: :destroy
  has_many :user_upload_documents, dependent: :destroy
  has_many :report_documents, dependent: :destroy

  def is_liked user
    Like.find_by(document_id: id, user_id: user.id)
  end

  def is_reported user
    ReportDocument.find_by(document_id: id, user_id: user.id)
  end
end
