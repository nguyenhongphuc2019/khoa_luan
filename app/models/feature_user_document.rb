class FeatureUserDocument < ApplicationRecord
  belongs_to :document

  enum gender: {Male: "Male", Fermale: "Fermale"}
  enum status: {Student: "Student", Intern: "Intern", Junior: "Junior", Senior: "Senior", 
    Profesional: "Profesional", Expert: "Expert"}
  enum generation: {Young: "Young", Middle: "Middle", Old: "Old"}
end
