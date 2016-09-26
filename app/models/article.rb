class Article < ActiveRecord::Base
  belongs_to :author, -> {order(:name)}
  belongs_to :article_category

  scope :by_author, -> (author_id) { where(author_id: author_id)}
  scope :by_title,   -> (title)      { where("title ILIKE '%#{title}%'")}

  validates :title, :content, :author, presence: true

  def code
    "#{'%06d' % id}"
  end
end
