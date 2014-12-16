require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe Advertisement, :type => :model do
	context "relationships" do
		it { should belong_to(:user)}
	end
end
