class JuridicalReport < ActiveRecord::Base
  has_many :articles, class_name: "JuridicalReportArticle", dependent: :destroy

  enum situation: ['rascunho', 'revisão', 'pronto']

  validates :name, :description, :date, :code, presence: true
  validates :code, uniqueness: true
end
