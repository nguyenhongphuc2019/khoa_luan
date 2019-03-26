class FeatureDocument < ApplicationRecord
  belongs_to :document
  belongs_to :feature
end
