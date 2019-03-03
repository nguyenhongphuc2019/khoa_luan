class Document < ApplicationRecord
  belongs_to :category, dependent: :destroy
  mount_uploader :source_file, SourceFileUploader
  mount_uploader :image, ImageUploader

  has_many :keywords, as: :keywordable, dependent: :destroy
end
