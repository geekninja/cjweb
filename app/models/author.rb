class Author < ActiveRecord::Base
  has_many :articles

  scope :by_name, -> (value) { where("name ILIKE '%#{value}%'")}
end
