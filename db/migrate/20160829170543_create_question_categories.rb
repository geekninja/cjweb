class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|

    
      t.string  :name 
      t.string  :description
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end