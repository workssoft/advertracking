require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe UserSessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end

		it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
 		end

  end

  describe "POST create" do
		
		context "with correct credentials" do
    	let!(:user) { User.create(first_name: "Jason", last_name: "Seifer", email: "jason@teamtreehouse.com", password: "treehouse1", password_confirmation: "treehouse1")}	
			it "redirects to the advertisements path" do
				post :create, email: "jason@teamtreehouse.com", password: "treehouse1", password_confirmation: "treehouse1"
				expect(response).to be_redirect
				expect(response).to redirect_to(advertisements_path)
			end

			it "finds the user" do
				expect(User).to receive(:find_by).with({ email: "jason@teamtreehouse.com" }).and_return(user)
				post :create, email: "jason@teamtreehouse.com", password: "treehouse1", password_confirmation: "treehouse1"
			end

			it "authenticates the user" do
				User.stub(:find_by).and_return(user)				
				expect(user).to receive(:authenticate)
				post :create, email: "jason@teamtreehouse.com", password: "treehouse1"
			end

		end
  end

end
