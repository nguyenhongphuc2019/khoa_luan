class Document < ApplicationRecord
  include Impressionist::IsImpressionable
  belongs_to :category
  mount_uploader :source_file, SourceFileUploader, dependent: :destroy
  mount_uploader :image, ImageUploader, dependent: :destroy
  has_many :feature_user_documents, dependent: :destroy
  belongs_to :language
  is_impressionable counter_cache: :true, column_name: :total_view, unique: :request_hash
end
