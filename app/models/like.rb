class Like < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates_uniqueness_of :document_id
end
