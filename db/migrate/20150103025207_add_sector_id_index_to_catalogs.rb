class AddSectorIdIndexToCatalogs < ActiveRecord::Migration
  def change
    add_index :catalogs, :sector_id
  end
end
