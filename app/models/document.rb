class Document < ApplicationRecord
  belongs_to :category
  mount_uploader :source_file, SourceFileUploader, dependent: :destroy
  mount_uploader :image, ImageUploader, dependent: :destroy
  has_many :feature_user_documents, dependent: :destroy
  belongs_to :language
end
