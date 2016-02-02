require 'rails_helper'

RSpec.describe Forum, type: :model do

  it "has a valid factory" do
  	expect(FactoryGirl.create(:forum)).to be_valid
  end

  context "when viewing forums" do

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

  context "when creating topics" do

    describe ".new_topic" do
      let(:guest) { FactoryGirl.create(:user, name: "Guest", permission_level: 4)}
      let(:member) { FactoryGirl.create(:user, name: "Member", permission_level: 2)}
      let(:officer) { FactoryGirl.create(:user, name: "Officer", permission_level: 1)}
      let(:mom) { FactoryGirl.create(:user, name: "Mom", permission_level: 0)}

      let(:forum_guest) { FactoryGirl.create(:forum, name: "Guest", visibility: 5)}

      it "creates a Topic and a Post" do

        post_data = { content: "My first post's content", author_id: guest.id }

        topic_data = { visibility: forum_guest.visibility, forum_id: forum_guest.id,
          user_id: guest.id, title: "My first post's title" }

        allow(Topic).to receive(:make_topic).and_return FactoryGirl.create(:topic)
        allow(Post).to receive(:make_first_post).and_return FactoryGirl.create(:post)
        @topic = Forum.new_topic post_data, topic_data
        expect(Topic.all.count).to eql 1
        expect(Post.all.count).to eql 1

      end

    end

  end

end
