class Company < ActiveRecord::Base
	has_many :advertisements
	belongs_to :sector
end
