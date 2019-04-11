class FeatureUserDocument < ApplicationRecord
  belongs_to :document
  belongs_to :feature

  # enum gender: [:Male, :Fermale]
  enum status: [:Student, :Intern, :Junior, :Senior, :Profesional, :Expert]
  enum generation: [:Young, :Middle, :Old]
end
