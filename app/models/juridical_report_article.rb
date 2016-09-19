class JuridicalReportArticle < ActiveRecord::Base
  belongs_to :juridical_report
  belongs_to :article

  validates_uniqueness_of :article_id, scope: :juridical_report_id
  validate :article_exists?

  private

  def article_exists?
    article = Article.find(self.article_id.to_i) rescue nil
    errors.add(:article_id, "Artigo não existe") if article.nil?
  end
end
