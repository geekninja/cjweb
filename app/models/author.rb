class Author < ActiveRecord::Base
  has_many :articles

  enum user_type: ['assinante', 'comum']

  scope :by_name, -> (value) { where("name ILIKE '%#{value}%'")}
end
