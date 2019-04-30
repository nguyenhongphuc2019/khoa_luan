class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader, dependent: :destroy
  serialize :main_major, Array
  after_update :create_feature
  has_many :likes
  has_many :documents, through: :likes

  enum state: {Student: "Student", Intern: "Intern", Junior: "Junior", Senior: "Senior", 
  Profesional: "Profesional", Expert: "Expert"}

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
  
  private

  def create_feature
    user = User.current
    fa_user = FeatureAttributesUser.where(user_id: user.id)
    if fa_user.exists? 
      fa_user.update_all(gender: user.gender, birth_day: user.birth_day, state: user.state, main_major: user.main_major)
    else
      FeatureAttributesUser.create(user_id: user.id, gender: user.gender, birth_day: user.birth_day, 
        state: user.state, main_major: user.main_major)
    end
  end
end

