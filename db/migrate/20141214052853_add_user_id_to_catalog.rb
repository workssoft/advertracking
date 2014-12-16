class AddUserIdToCatalog < ActiveRecord::Migration
  def change
		add_column :catalogs, :user_id, :integer
 		add_index :catalogs, :user_id
 	end
end
