class AddAuthorIdToMigrateArticle < ActiveRecord::Migration
  def change
    add_column :migrate_articles, :author_id, :integer
  end
end
