class Feature < ApplicationRecord
  has_many :feature_users
  has_many :users, through: :feature_users 
end
