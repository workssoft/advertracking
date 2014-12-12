require File.expand_path("../../../rails_helper", __FILE__)

describe "Listing Sector List" do
	it "requires login" do
		visit "/sectors"
		expect(page).to have_content("You must be logged in")
	end
end

