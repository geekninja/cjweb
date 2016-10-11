class AddCategoryIdsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :category_ids, :text, array: true, default: []
  end
end
