 require File.expand_path("../../../rails_helper", __FILE__)

 describe "Editing Catalog List" do
 	let(:user) { catalog.user }
	let!(:sector) { create(:sector) }
	#let!(:catalog) { user.catalogs.create(name: "Katalog1", sector_id: sector.id, description: "Bu bir katalog", user_id: user.id )}
	let!(:catalog) { create(:catalog, sector_id: sector.id ) }

	def update_a_catalog(options={})
		options[:name] ||= "My Catalog"
		options[:description] ||= "Bu bir katalogtur"
		sector = options[:sector]
		catalog = options[:catalog]

		visit "/catalogs"

		within "#catalog_#{catalog.id}" do
			click_link "Edit"	
		end

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		select "Petrol 1", from: 'catalog_sector_id'
		click_button "Save"
	end
	
	before do
		sign_in catalog.user, password: "treehouse1"
	end

	it "updates a catalog list successfully with correct information" do
		update_a_catalog sector: sector,
										 catalog: catalog,
  									 name: "New Catalog Name",
										 description: "New description"

		catalog.reload
    
		#puts page.body

		expect(page).to have_content("Catalog was successfully updated.")
		expect(catalog.name).to eq("New Catalog Name")
		expect(catalog.description).to eq("New description")
	end

	it "displays an error with no name" do
		update_a_catalog catalog: catalog, name:""
		name = catalog.name
		catalog.reload
		puts name
		expect(catalog.name).to eq(name)
		expect(page).to have_content("error")
	end

	it "displays an error with too short a name" do
		update_a_catalog catalog: catalog, name: "hi"
		expect(page).to have_content("error")
	end

	it "displays an error with no description" do
		update_a_catalog catalog:catalog, description: ""
		expect(page).to have_content("error")
	end

	it "displays an error with too short a description" do
		update_a_catalog catalog:catalog, description: "hi"
		expect(page).to have_content("error")
	end
 end

