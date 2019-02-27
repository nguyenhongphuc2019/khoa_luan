class Document < ApplicationRecord
  belongs_to :category
  mount_uploader :source_file, SourceFileUploader
end
