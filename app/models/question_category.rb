class QuestionCategory < ActiveRecord::Base
  has_many :questions
  validates :name, presence: true, uniqueness: true

end
