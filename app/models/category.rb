class Category < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :keywords, as: :keywordable

  scope :main, -> {order(order: :asc).where(parent_id: nil) }
  scope :sub, -> (category_id) {order(order: :asc).where("parent_id=?", category_id)}
end
