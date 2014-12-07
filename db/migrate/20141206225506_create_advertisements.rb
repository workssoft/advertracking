class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
			
			t.string :title
			t.belongs_to :user
			t.belongs_to :priority
			t.belongs_to :sector
			t.belongs_to :company
			t.belongs_to :catalog
			t.datetime :call_date
			t.text :notes

      t.timestamps
    end
  end
end
