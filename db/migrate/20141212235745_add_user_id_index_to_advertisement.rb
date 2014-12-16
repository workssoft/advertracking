class AddUserIdIndexToAdvertisement < ActiveRecord::Migration
  def change
  	add_index :advertisements, :user_id
	end
end
