class Question < ActiveRecord::Base
  
  belongs_to :question_category
  has_many   :question_options

  enum difficulty: ['baixa', 'média', 'alta']
  enum context:    ['múltipla_escolha', 'escolha_única']

  accepts_nested_attributes_for :question_options, allow_destroy: true
  
  validates :description, :question_category, :code, :difficulty, :context, presence: true

  validate :has_one_option?

  private

  def has_one_option?
    if !self.question_options.present?
      errors.add(:context, "A questão precisa de pelo menos duas opções de escolha")
    end
  end  
end
