class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      
      t.integer :question_id, index: true
      t.text    :description
      t.boolean :correct, default: false

      t.timestamps null: false
    end
  end
end
