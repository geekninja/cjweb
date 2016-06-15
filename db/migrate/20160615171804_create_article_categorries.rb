class CreateArticleCategorries < ActiveRecord::Migration
  def change
    create_table :article_categorries do |t|
      t.string  :name 
      t.string  :description
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
