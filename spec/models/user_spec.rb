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
		it 'accepts permission levels inclusive of 0-4' do

			(0..4).to_a.each do |i|
				expect(FactoryGirl.build(:user, permission_level: i)).to be_valid
			end

		end
	end

	describe '.find_or_create' do
		it 'returns an existing user' do
			skip
		end
		it 'creates a new user'
	end

	describe 'model defaults' do
		it 'defaults permission level to 4'
	end

end