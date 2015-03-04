require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe AdvertisementsController, :type => :controller do

	let(:valid_attributes) {{ "title" => "My Title", "notes" => "My Notes" }}

	let(:valid_session){ {} }

	before do
		sign_in(build_stubbed(:user))
	end
	
	describe "GET index" do
		context "logged in" do
			it "assigns all advertisements as @advertisements" do
				advertisement = Advertisement.create! valid_attributes
				get :index, {}, valid_session
				assigns(:advertisements).should eq([advertisement])
			end
		end

	end

  describe "GET new" do
    it "returns http success" do
      get :new
      #expect(response).to be_success
			#response.should be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      #get :create
      #expect(response).to be_success
    end
  end

  describe "GET update" do
    it "returns http success" do
      #get :update
      #expect(response).to be_success
    end
  end

end
