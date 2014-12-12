class Company < ActiveRecord::Base
	has_many :advertisement
	belongs_to :sector
end
