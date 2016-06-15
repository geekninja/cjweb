class Article < ActiveRecord::Base
  belongs_to :author

  scope :by_author, -> (author_id) { where(author_id: author_id)}
end
