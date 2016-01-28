Given(/^I am not logged in$/) do
	visit logout_path
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