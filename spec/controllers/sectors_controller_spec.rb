require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe SectorsController, :type => :controller do
	
let(:valid_attributes) { { "name" => "Name", "description" => "Description" } }

let(:valid_session) { {} }

let!(:user) { create(:user) }

before do
	sign_in(user)
end

describe "GET index" do
	context "logged in" do
		it "assigns all sectors as @sectors" do
			sector = Sector.create! valid_attributes
			get :index, {}, valid_session
			assigns(:sectors).should eq([sector])
			#expect(assigns(:sectors).map(&:user)).to eq([user])
		end
	end
end


describe "GET new" do
	it "assigns a new sector as @sector" do
		get :new, {}, valid_session
		assigns(:sector).should be_a_new(Sector)
	end	
end

describe "GET edit" do
	it "assigns the requested sector as @sector" do
		sector = user.sectors.create! valid_attributes
		get :edit, {:id => sector.to_param}, valid_session
		assigns(:sector).should eq(sector)
		expect(assigns(:sector).user).to eq(user)
	end
end

describe "POST create" do
	describe "with valid params" do
		it "creates a new sector" do
			expect {
				post :create, {:sector => valid_attributes}, valid_session
			}.to change(Sector, :count).by(1)
		end

		it "assigns a newly created sector as @sector" do
			post :create, {:sector => valid_attributes }, valid_session
			assigns(:sector).should be_a(Sector)
			assigns(:sector).should be_persisted
		end

		it "redirects to the created sector" do
			post :create, {:sector => valid_attributes }, valid_session
			response.should redirect_to(Sector.last)
		end

		it "creates a sector for the current user" do
			post :create, {:sector => valid_attributes }, valid_session
			sector = Sector.last
			expect(sector.user).to eq(user)
		end

		it "does not allow users to create sectors for other users" do
			other_user = create(:user)
			post :create, {:sector => valid_attributes.merge(user_id: other_user.id)}, valid_session
			sector = Sector.last
			expect(sector.user).to eq(user)
		end
	end

	describe "with invalid params" do
		it "assigns a newly created but unsaved sector as @sector" do
			#Trigger the behavior that occurs when invalid params are submitted
			Sector.any_instance.stub(:save).and_return(false)
			post :create, {:sector => { "name" => "invalid value" }}, valid_session
			assigns(:sector).should be_a_new(Sector)
			#expect(assigns(:sector))
		end

		it "re-renders the 'new' template" do
			#Trigger the behavior that occurs when invalid params are submitted
			Sector.any_instance.stub(:save).and_return(false)
			post :create, {:sector => { "name" => "invalid value" }}, valid_session
			response.should render_template(:new)
		end
	end
end

end
