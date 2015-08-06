FactoryGirl.define do
	time = DateTime.new 2001, 2, 3
	factory :user do |u|
		u.id { 1 }
		u.name { "elarun" }
		u.provider { 'bnet' }
		u.uid { '12345' }
		u.oauth_token { 'token' }
		u.oauth_expires_at { time }
	end
end