require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe CatalogsController, :type => :controller do
 
let!(:sector) { create :sector }
let!(:user) { create(:user) }
let(:valid_attributes) { { "name" => "Name", "sector_id" => sector.id, "description" => "Description", "user_id" => user.id } }

let(:valid_session) { {} }

before do
	sign_in(user)
end

describe "GET index" do
	context "logged in" do
		it "assigns all catalogs as @catalogs" do
			catalog = user.catalogs.create! valid_attributes
			get :index, { }, valid_session
			#expect(assigns(:catalogs)).to eq([catalog])
			assigns(:catalogs).should eq([catalog])
			expect(assigns(:catalogs).map(&:user)).to eq([user])
		end

		it "does not load other user's catalog list" do
			other_catalog_list = Catalog.create!(valid_attributes.merge(user_id: create(:user).id))
			get :index, {}, valid_session
			expect(assigns(:catalogs)).to_not include(other_catalog_list)
		end

	end
end

describe "GET show" do
	it "assigns the requested catalog list as @catalogs for the logged in user" do
		catalog = user.catalogs.create! valid_attributes
		get :show, { :id => catalog.to_param }, valid_session
		assigns(:catalog).should eq(catalog)
		expect(assigns(:catalog).user).to eq(user)
	end

end

describe "GET new" do
	it "assigns a new catalog as @catalog" do
		get :new, {}, valid_session
		assigns(:catalog).should be_a_new(Catalog)
		expect(assigns(:catalog).user).to eq(user)
	end	
end


describe "GET edit" do
	it "assigns the requested catalog as @catalog" do
		catalog = user.catalogs.create! valid_attributes
		get :edit, { :id => catalog.to_param }, valid_session
		assigns(:catalog).should eq(catalog)
		expect(assigns(:catalog).user).to eq(user)
	end
end
 

describe "POST create" do
	describe "with valid params" do
		
		it "creates a new catalog" do
			expect{
				post :create, { :catalog => valid_attributes }, valid_session
		 	}.to change(Catalog, :count).by(1)
		end

		it "assigns a newly created catalog as @catalog" do
			post :create, { :catalog => valid_attributes }, valid_session
			assigns(:catalog).should be_a(Catalog)
			assigns(:catalog).should be_persisted
		end

		it "redirects to the created catalog" do
			post :create, { :catalog => valid_attributes }, valid_session
			response.should redirect_to(Catalog.last)
		end

		it "creates a catalog for the current user" do
			post :create, { :catalog => valid_attributes }, valid_session
			catalog = Catalog.last
			expect(catalog.user).to eq(user)
		end

		it "does not allow users to create catalogs for other users" do
			other_user = create(:user)
			post :create, {:catalog => valid_attributes.merge(user_id: other_user.id)}, valid_session
			catalog = Catalog.last
			expect(catalog.user).to eq(user)	
		end
	end


	describe "with invalid params" do
		it "assigns a newly created but unsaved catalog as @catalog" do
			#Trigger the behavior that occurs when invalid params are submitted
			Catalog.any_instance.stub(:save).and_return(false)
			post :create, {:catalog => { "name" => "invalid value" }}, valid_session
			assigns(:catalog).should be_a_new(Catalog)		
		end

		it "re-renders the 'new' template" do
			#Trigger the behavior that occurs when invalid params are submitted
			Catalog.any_instance.stub(:save).and_return(false)
			post :create, {:catalog => { "name" => "invalid value" }}, valid_session
			response.should render_template(:new)
		end
	end
end

end
