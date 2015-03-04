require File.expand_path("../../../rails_helper", __FILE__)

describe "Creating menu list" do
	let(:user){ create(:user) }
	
	before do
		sign_in(user, password: "treehouse1")
	end

	it "requires advertisement link on left menu" do
		visit "/"
		expect(page).to have_content("İlanlar")
	end

	it "requires catalogs link on left menu" do
		visit "/"
		expect(page).to have_content("Kataloglar")
	end

	it "requires sectors link on left menu" do
		visit "/"
		expect(page).to have_content("Sektörler")
	end
	
	it "requires companies link on left menu" do
		visit "/"
		expect(page).to have_content("Şirketler")
	end

	it "requires users link on right menu" do
		visit "/"
		expect(page).to have_content("Çalışanlar")
	end
end
