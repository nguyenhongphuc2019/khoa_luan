class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader, dependent: :destroy
  has_many :feature_users, dependent: :destroy
  has_many :features, through: :feature_users, dependent: :destroy
  serialize :main_major, Array
  after_update :create_feature

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
  
  private

  def create_feature
    user = User.current
    if user.gender.present?
      feature_gender = Feature.create(name: "gender-#{user.id}", value: user.gender)
      FeatureUser.create(user_id: user.id, feature_id: feature_gender.id)
    end
    if user.birth_day.present?
      feature_birth_day = Feature.create(name: "birth_day-#{user.id}", value: user.birth_day)
      FeatureUser.create(user_id: user.id, feature_id: feature_birth_day.id)
    end
    if user.state.present?
      feature_status = Feature.create(name: "state-#{user.id}", value: user.state) 
      FeatureUser.create(user_id: user.id, feature_id: feature_status.id)
    end
    if user.main_major.present?
      feature_main_major = Feature.create(name: "main_major-#{user.id}", value: user.main_major)
      FeatureUser.create(user_id: user.id, feature_id: feature_main_major.id)
    end
  end
end

