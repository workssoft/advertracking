require 'rails_helper'

RSpec.describe AdvertisementsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to be_success
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to be_success
    end
  end

end
