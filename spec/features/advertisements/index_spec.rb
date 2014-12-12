require File.expand_path("../../../rails_helper", __FILE__)

describe "Listing advertisememnt lists" do
	it "requires login" do
		visit "/advertisements"
		expect(page).to have_content("You must be logged in")
	end
end 
	
