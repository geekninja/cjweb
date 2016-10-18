class AddFatherIdToArticleCategories < ActiveRecord::Migration
  def change
    add_column :article_categories, :father_id, :integer
  end
end
