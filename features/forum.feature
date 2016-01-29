Feature: Forums

	Scenario: Public visibility is correct
		Given I am not logged in
		And there is a forum named "Applications" visible by "guests"
		And there is a forum named "General" visible by "guests"
		And there is a forum named "Guild Hall" visible by "members"
		And there is a forum named "Raiding" visible by "members"
		And there is a forum named "Class" visible by "members"
		And there is a forum named "Officers" visible by "officers"
		When I visit the "Forum" page
		Then I should see "Applications"
		And I should see "General"
		And I should not see "Guild Hall"
		And I should not see "Raiding"
		And I should not see "Class"
		And I should not see "Officers"

	Scenario: Guest visibility is correct
		Given I am logged in as a "guest" user
		And there is a forum named "Applications" visible by "guests"
		And there is a forum named "General" visible by "guests"
		And there is a forum named "Guild Hall" visible by "members"
		And there is a forum named "Raiding" visible by "members"
		And there is a forum named "Class" visible by "members"
		And there is a forum named "Officers" visible by "officers"
		When I visit the "Forum" page
		Then I should see "Applications"
		And I should see "General"
		And I should not see "Guild Hall"
		And I should not see "Raiding"
		And I should not see "Class"
		And I should not see "Officers"