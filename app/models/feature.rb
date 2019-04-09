class Feature < ApplicationRecord
  has_many :feature_users, dependent: :destroy
  has_many :users, through: :feature_users
  has_many :feature_documents, dependent: :destroy
  has_many :documents, through: :feature_documents
end
