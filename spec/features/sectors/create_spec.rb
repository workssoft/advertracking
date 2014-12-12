require File.expand_path("../../../rails_helper", __FILE__)

describe "Creating a sector" do
	let(:user) { create(:user) }

	def create_a_sector(options={})
		options[:name] ||= "My Sector"
		options[:description] ||= "This is the description of the sector."
 
		visit "/sectors"
		click_link "New Sector"
		#puts body
		expect(page).to have_content("New Sector")
 
		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		click_button "Save"
	end

	before do
		sign_in(user, password: "treehouse1")
	end

	it "redirects to the sector list index page on success" do
		create_a_sector
		expect(page).to have_content("My Sector List")
	end

	it "displays an error when the sector list has no name" do
		expect(Sector.count).to eq(0)

		create_a_sector name:""

		expect(page).to have_content("error")
		expect(Sector.count).to eq(0)

		visit "/sectors"
		expect(page).to_not have_content("This is what I'am doing today.")
	end

	it "displays an error when the sector has a name less than 3 characters" do
		expect(Sector.count).to eq(0)

		create_a_sector name: "Hi"

		expect(page).to have_content("error")
		expect(Sector.count).to eq(0)

		visit "/sectors"
		expect(page).to_not have_content("This is what I'am doing today.")
	end

	it "displays an error when the sector list has no description" do
		expect(Sector.count).to eq(0)

		create_a_sector name: "sektör", description: ""

		expect(page).to have_content("error")
		expect(Sector.count).to eq(0)

		visit "/sectors"
		expect(page).to_not have_content("sektör")
	end

end
