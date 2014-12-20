 require File.expand_path("../../../rails_helper", __FILE__)

 describe "Deleting a catalog" do
	
 	let(:user) { catalog.user }
	let!(:sector) { create(:sector) }
	let!(:catalog) { create(:catalog, sector_id: sector.id ) }
	 
	#let(:user) { create(:user) }
	#let!(:sector) { create(:sector) }
	#let!(:catalog) { Catalog.create(name: "Katalog 1", sector_id: sector.id, description: "Bu bir katalog", user_id: user.id )}

	before do
		sign_in catalog.user, password: "treehouse1"
	end

	it "is successfully deleted when clicking the destroy link" do
		visit "/catalogs"
		
		#puts page.body

		within "#catalog_#{catalog.id}" do
			click_link "Destroy"
		end

		expect(page).to_not have_content(catalog.name)
		expect(Catalog.count).to eq(0)
	end
 end
 

