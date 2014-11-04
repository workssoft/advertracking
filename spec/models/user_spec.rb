require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe User, :type => :model do

  let(:valid_attributes){
    { 
      first_name: "Jason",
      last_name: "Seifer",
      email: "jason@teamtreehouse.com"
    }
  }

  context "validations" do
    let(:user){ User.new(valid_attributes) }
    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end
  end
	
end
