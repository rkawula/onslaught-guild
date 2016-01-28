require 'rails_helper'

RSpec.describe Forum, type: :model do

  it "has a valid factory" do
  	expect(FactoryGirl.create(:forum)).to be_valid
  end

  describe "#get_visible_forums" do

  	let(:user) { FactoryGirl.create(:user, name: "MsLoggedIn") }

  	let(:forum_guest) { FactoryGirl.create(:forum, name: "Guest", visibility: 5)}
  	let(:forum_public) { FactoryGirl.create(:forum, name: "Public", visibility: 4)}
  	let(:forum_member) { FactoryGirl.create(:forum, name: "Member", visibility: 3)}
  	let(:forum_officer) { FactoryGirl.create(:forum, name: "Officer", visibility: 2)}

  	it "gets only guest forums when given guest permission" do
  		expect(Forum.get_visible_forums(5)).to contain_exactly
  			forum_guest
  	end

  	it "gets guest and public forums when given public permission" do
  		expect(Forum.get_visible_forums(4)).to contain_exactly(
  			forum_guest, forum_public)
  	end

  	it "gets guest, public, and member forums when given member permission" do
  		expect(Forum.get_visible_forums(3)).to contain_exactly(
  			forum_guest, forum_public, forum_member)
  	end

  	it "gets all forums when given officer permission" do
  		expect(Forum.get_visible_forums(2)).to contain_exactly(
  			forum_guest, forum_public, forum_member, forum_officer)
  	end

  end

end
