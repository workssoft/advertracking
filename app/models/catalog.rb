class Catalog < ActiveRecord::Base

	#Relationships
	belongs_to :user
	has_many :advertisements

	#Validations
	validates :name, presence: true,
									length: { minimum: 3 }
	validates :description, presence: true,
									length: { minimum: 5 }
	validates :sector_id, presence: true

end
