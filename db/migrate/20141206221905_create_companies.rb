class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
			t.string :company_name
			t.string :company_telephone_1
			t.string :company_telephone_2
			t.string :company_email
			t.text :company_address
			t.string :representative_fullname
			t.string :representative_telephone
			t.string :representative_email
			t.string :web_address

      t.timestamps
    end
  end
end
