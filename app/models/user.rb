class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader, dependent: :destroy
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
    FeatureAttributesUser.create(user_id: user.id, gender: user.gender, birth_day: user.birth_day, 
      state: user.state, main_major: user.main_major)
  end
end

