class Article < ActiveRecord::Base
  belongs_to :author, -> {order(:name)}

  default_scope { order('created_at DESC')}

  scope :by_author, -> (author_id) { where(author_id: author_id)}
  scope :by_title,   -> (title)      { where("title ILIKE '%#{title}%'")}

  validates :title, :content, :author, presence: true

  def code 
    "#{'%06d' % id}"
  end
end
