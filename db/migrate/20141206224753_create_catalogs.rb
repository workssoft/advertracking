class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
			t.string :name
			t.belongs_to :sector
			t.text :description
      t.timestamps
    end
  end
end
