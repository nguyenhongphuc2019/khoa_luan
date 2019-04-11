class FeatureCategoriesDocument < ApplicationRecord
  belongs_to :document
  serialize :main_major, Array
end
