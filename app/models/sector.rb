class Sector < ActiveRecord::Base
	has_many :advertisement
	has_many :company

	validates :name, presence: true, length: { minimum: 3 }
	validates	:description, presence: true, length: { minimum: 3}	 
end
