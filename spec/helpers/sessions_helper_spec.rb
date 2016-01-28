require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  
	describe "permissions" do

		it "returns 5 when user is not logged in" do
			allow(helper).to receive(:logged_in?).and_return false
			expect(helper.permission).to eql 5
		end

		it "returns the user's permission level when logged in" do
			(4..1).each do |i|
				user = FactoryGirl.create(:user, permission_level: i)
				allow(helper).to receive(:current_user).and_return user
				expect(helper.permission).to eql i
			end
		end


	end

end
