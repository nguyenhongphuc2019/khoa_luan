class Verb < ApplicationRecord
  has_many :keywords
  
  has_many :documents, through: :keywords, source: :keywordable, source_type: 'Document'
  has_many :categories, through: :keywords, source: :keywordable, source_type: 'Category'
end
