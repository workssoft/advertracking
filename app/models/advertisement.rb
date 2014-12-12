class Advertisement < ActiveRecord::Base
	belongs_to :catalog
	belongs_to :company
	belongs_to :priority
	belongs_to :sector
	belongs_to :user
end
