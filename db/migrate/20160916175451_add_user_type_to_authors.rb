class AddUserTypeToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :user_type, :integer
  end
end
