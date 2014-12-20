require File.expand_path("../../rails_helper", __FILE__)

RSpec.describe Catalog, :type => :model do
	describe "relationships" do
		it { should belong_to(:user) }
	end	
end
