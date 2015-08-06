require 'utilities/user_spec'

RSpec.describe User, type: :model do 

	it 'has a valid factory' do
		expect(FactoryGirl.create(:user)).to be_valid
	end

	describe 'model validations' do
		it 'rejects permission levels below 0' do
			expect(FactoryGirl.build(:user, permission_level: -1)).not_to be_valid
		end
		it 'rejects permission levels above 4' do
			expect(FactoryGirl.build(:user, permission_level: 5)).not_to be_valid
		end
		it 'rejects when given no permission level' do
			expect(FactoryGirl.build(:user, permission_level: nil)).not_to be_valid
		end
		it 'accepts permission levels inclusive of 0-4' do
			(0..4).to_a.each do |i|
				expect(FactoryGirl.build(:user, permission_level: i)).to be_valid
			end
		end
	end

	describe '.find_or_create' do
		let(:time) { DateTime.new 2001, 2, 3 }
		let(:auth) { UserUtilities.new }

		it "if the database has that user, returns the existing user" do
			allow(auth).to receive(:provider).and_return 'bnet'
			allow(auth).to receive(:uid).and_return '12345'
			target = FactoryGirl.create(:user, oauth_expires_at: time)
			user = User.find_or_create(auth)
			expect(UserUtilities.users_are_equal? user, target).to be true
		end
		it 'creates a new user if user id not in database' do
			allow(auth).to receive(:provider).and_return 'bnet'
			allow(auth).to receive(:uid).and_return '2345'
			allow(auth).to receive(:battletag).and_return 'elarun'
			allow(auth).to receive(:token).and_return 'token'
			allow(auth).to receive(:expires_at).and_return time
			new_user = FactoryGirl.build(:user, uid: '2345')
			user_in_database = User.find_or_create(auth)
			expect(UserUtilities.users_are_equal? new_user, user_in_database).to be true
		end
	end

	describe 'model defaults' do
		it 'defaults permission level to 4' do
			user = FactoryGirl.build(:user)
			expect(user.permission_level).to eq 4
		end
	end

end