class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader, dependent: :destroy
  has_many :feature_users
  has_many :features, through: :feature_users
  serialize :main_major, Array     
end

