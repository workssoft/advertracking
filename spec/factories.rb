FactoryGirl.define do
	factory :user do
		first_name "First"
		last_name "Last"
		sequence(:email) { |n| "user#{n}@odot.com" }
		password "treehouse1"
		password_confirmation "treehouse1"
	end	

	factory :sector do
		#sequence(:name) { |n| "Petrol #{n}" }
		name "Petrol 1"
		description "Petrol Sektörü"
	end

	factory :catalog do
		name "Katalog1"
    sector
	 	description "Bu bir katalog"
	 	user
	end
end
