class Sector < ActiveRecord::Base
	has_many :advertisements
	has_many :companies

	validates :name, presence: true, length: { minimum: 3 }
	validates	:description, presence: true, length: { minimum: 5}	 
end
