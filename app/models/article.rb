class Article < ActiveRecord::Base
  belongs_to :author, -> {order(:name)}

  default_scope { order('created_at DESC')}

  scope :by_author, -> (author_id) { where(author_id: author_id)}
  scope :by_title,   -> (title)      { where("title ILIKE '%#{title}%'")}

  scope :by_category, -> (category_id) { where("'#{category_id}' = ANY (category_ids)") }

  validates :title, :content, :author, presence: true

  def categories_id
    ::ArticleCategory.where(id: self.category_ids)
  end

  def code
    "#{'%06d' % id}"
  end
end
