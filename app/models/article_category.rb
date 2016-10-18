class ArticleCategory < ActiveRecord::Base
  belongs_to  :father, class_name: "ArticleCategory"
  has_many    :articles

  validates :name, presence: true 

  def complete_name
    if self.father.present?
      if self.father.father.present?
        "#{self.father.father.name} / #{self.father.name} / #{self.name}"
      else 
        "#{self.father.name} / #{self.name}"
      end
    else
      self.name
    end
  end

end
