class Document < ApplicationRecord
  belongs_to :category
  mount_uploader :source_file, SourceFileUploader
  mount_uploader :image, ImageUploader
end
