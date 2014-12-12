require File.expand_path("../../../rails_helper", __FILE__)

describe "Editing Sector List" do
	let(:user) { create(:user) }
	let(:sector) { Sector.create(name: "Petrol", description: "Petrol Sektörü" ) }

	def update_a_sector(options={})
		options[:name] ||= "My Sector"
		options[:description] ||= "This is my sector."
		sector = options[:sector]

		visit "/sectors"
		
		#puts page.body

		within "#sector_#{sector.id}" do
			click_link "Edit"
	  end

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		click_button "Save"
	end

	before do
		sign_in user, password: "treehouse1"
	end

	it "updates a sector list successfully with correct information" do
		update_a_sector sector: sector,
										name: "New Sector Name",
										description: "New description"

		sector.reload

		expect(page).to have_content("Sector was successfully updated")
		expect(sector.name).to eq("New Sector Name")
		expect(sector.description).to eq("New description")
	end

	it "displays an error with no name" do
		update_a_sector sector: sector, name: ""
		name = sector.name
		sector.reload
		puts name
		expect(sector.name).to eq(name)
		expect(page).to have_content("error")
	end

	it "displays an error with too short a name" do
		update_a_sector sector: sector, name:"hi"
		expect(page).to have_content("error")
	end

	it "displays an error with no description" do
		update_a_sector sector:sector, description: ""
		expect(page).to have_content("error")
	end

	it "displays an error with too short a description" do
		update_a_sector sector:sector, description: "hi"
		expect(page).to have_content("error")
	end

end

