require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	describe "GET #new" do

		it 'redirects the user to log in with battle.net' do
			get :new
			expect(response).to redirect_to '/auth/bnet'
		end

	end

	describe "GET #create" do

		let(:hash) { Hash.new }

		before :each do
			@fake_user = double(:user, provider: 'bnet', id: 1)
		end

		context 'when receiving callback from battle.net' do

			before :each do
				allow_any_instance_of(ApplicationController).to receive(:auth_hash).and_return :hash
				allow(User).to receive(:find_or_create).with(:hash).and_return @fake_user
			end

			it 'starts a new session and redirect to the homepage' do
				get :create, :provider => 'bnet'
				expect(response).to redirect_to root_url
				expect(session[:user_id]).to eq @fake_user.id
			end
		end
	end

	describe 'GET #destroy' do

		it 'ends the session' do
			get :destroy
			expect(session[:user_id]).to be_nil
			expect(response).to redirect_to root_url
		end

	end

	describe 'GET #failure' do
		it 'returns to the home page' do
			get :failure
			expect(response).to redirect_to root_url
		end
	end

end