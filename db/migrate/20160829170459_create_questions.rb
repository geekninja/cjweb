class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.integer :question_category_id, index: true
      
      t.text :description
      t.text :observation
      t.text :origin

      t.string :code
      
      t.integer :difficulty, default: 0
      t.integer :context,    default: 0
      
      t.boolean :publish, default: true
      t.text    :tags, array: true, default: []


      t.timestamps null: false
    end
  end
end
