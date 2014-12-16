require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe CatalogsController, :type => :controller do

let(:valid_attributes) { { "name" => "Name", "sector_id" => 1, "description" => "Description", "user_id" => 1 } }

let(:valid_session) { {} }

let!(:user) { create(:user) }

before do
	sign_in(user)
end

describe "GET index" do
	context "logged in" do
		it "assigns all catalogs as @catalogs" do
			catalog = Catalog.create! valid_attributes
			get :index, {}, valid_session
			assigns(:catalogs).should eq([catalog])
			expect(assigns(:catalogs).map(&:user)).to eq([user])
		end
	end
end


describe "GET new" do
	it "assigns a new catalog as @catalog" do
		get :new, {}, valid_session
		assigns(:catalog).should be_a_new(Catalog)
	end	
end


end
