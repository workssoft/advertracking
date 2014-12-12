require File.expand_path("../../../rails_helper", __FILE__)

describe "Deleting a sector" do
	let(:user) { create(:user) }
	let!(:sector) { Sector.create(name: "Petrol", description: "Petrol Sektörü") }

	before do
		sign_in user, password: "treehouse1"
	end

	it "is successfully when clicking the destroy link" do
		
		visit "/sectors"
		
		#puts page.body 
		
		within "#sector_#{sector.id}" do
			click_link "Destroy"
		end

		expect(page).to_not have_content(sector.name)
		expect(Sector.count).to eq(0)
	end
end

