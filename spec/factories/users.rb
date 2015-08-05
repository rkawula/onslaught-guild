FactoryGirl.define do
	factory :user do |u|
		u.name { "elarun" }
		u.provider { 'bnet' }
		u.uid { '12345' }
	end
end