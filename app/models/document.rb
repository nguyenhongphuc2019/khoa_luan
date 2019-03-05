class Document < ApplicationRecord
  belongs_to :category
  mount_uploader :source_file, SourceFileUploader, dependent: :destroy
  mount_uploader :image, ImageUploader, dependent: :destroy

  has_many :keywords, as: :keywordable, dependent: :destroy
end
