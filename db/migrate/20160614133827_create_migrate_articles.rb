class CreateMigrateArticles < ActiveRecord::Migration
  def change
    create_table :migrate_articles do |t|
      t.string :date
      t.string :author
      t.string :title
      t.string :link
      t.text :content

      t.timestamps null: false
    end
  end
end
