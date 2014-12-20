require File.expand_path("../../../rails_helper", __FILE__)
 
describe "Creating a catalog" do
	let(:user) { create(:user) }
	let!(:sector) { create(:sector) }

	def create_a_catalog(options={})
		options[:name] ||= "My catalog"
		options[:sector_id] ||= 1
		options[:description] ||= "This is what I'am doing today."
		options[:user_id] ||= 1

		visit "/catalogs"
		#puts page.body
		click_link "New Catalog"
		expect(page).to have_content("New Catalog")
		
		#puts page.body

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		select 'Petrol 1', from: 'catalog_sector_id'

		click_button "Save"
	end

	before do
		sign_in(user, password: "treehouse1")
	end

	it "redirects to the catalog list index page on success" do
		create_a_catalog
		expect(page).to have_content("New Catalog")
	end

	it "displays an error when the catalog list has no name" do
		expect(Catalog.count).to eq(0)

		create_a_catalog name:""

		expect(page).to have_content("error")
		expect(Catalog.count).to eq(0)

		visit "/catalogs"

		expect(page).to_not have_content("This is what I'am doing today.")
	end

	it "should select an element from sector dropdown" do
		#select(sector.id, from: )
	end

	it "displays an error when the catalog has a name less than 3 characters" do
		expect(Catalog.count).to eq(0)

		create_a_catalog name: "Hi"

		expect(page).to have_content("error")
		expect(Catalog.count).to eq(0)

		visit "/catalogs"
		expect(page).to_not have_content("This is what I'am doing today.")
	end

	it "displays an error when the catalog list has no description" do
		expect(Catalog.count).to eq(0)

		create_a_catalog name: "katalog1", description: ""

		expect(page).to have_content("error")
		expect(Catalog.count).to eq(0)

		visit "/catalogs"
		expect(page).to_not have_content("katalog1")
	end

	it "displays an error when the catalog has a description less than 5 characters" do
		expect(Catalog.count).to eq(0)

		create_a_catalog name: "katalog1", description: "Hiym"

		expect(page).to have_content("error")
		expect(Catalog.count).to eq(0)

		visit "/catalogs"
		expect(page).to_not have_content("Katalog1")
	end


end

