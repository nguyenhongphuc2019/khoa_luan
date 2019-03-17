class Keyword < ApplicationRecord
  belongs_to :keywordable, polymorphic: :true
  belongs_to :verb
end
