Given(/^I am not logged in$/) do
	visit root_path
	click_link "Log out" if page.has_content? "Log out"
end

Given(/^there is a forum named "([^"]*)" visible by "([^"]*)"$/) do |forum_name, visibility|
	permission_level = 5
	if visibility == "public"
		permission_level = 4
	elsif visibility == "members"
		permission_level = 3
	elsif visibility == "officers"
		permission_level = 2
	end
	Forum.create name: forum_name, visibility: permission_level
end

When(/^I visit the "([^"]*)" page$/) do |arg1|
	visit forum_index_path
end

Then(/^I should see "([^"]*)"$/) do |forum_name|
	expect(page).to have_content forum_name
end

Then(/^I should not see "([^"]*)"$/) do |forum_name|
	expect(page).to_not have_content forum_name
end

Given(/^I am logged in as a "([^"]*)" user$/) do |user_type|
	permission_level = 5
	if user_type == "public"
		permission_level = 4
	elsif user_type == "member"
		permission_level = 3
	elsif user_type == "officer"
		permission_level = 2
	end
	User.create permission_level: permission_level
end