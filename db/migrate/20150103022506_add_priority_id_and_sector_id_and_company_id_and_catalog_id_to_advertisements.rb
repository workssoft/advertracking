class AddPriorityIdAndSectorIdAndCompanyIdAndCatalogIdToAdvertisements < ActiveRecord::Migration
  def change
    add_index :advertisements, :priority_id
    add_index :advertisements, :sector_id
    add_index :advertisements, :company_id
    add_index :advertisements, :catalog_id
  end
end
