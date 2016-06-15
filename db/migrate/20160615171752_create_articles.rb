class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title 
      t.text    :content
      t.integer :author_id, index: true
      t.integer :old_id
      t.string  :old_link
      t.boolean :publish, default: true

      t.timestamps null: false
    end
  end
end
