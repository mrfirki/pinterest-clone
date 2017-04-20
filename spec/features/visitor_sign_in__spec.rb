require 'rails_helper'

RSpec.feature "Visitor sign in", :type => :feature do
	before :each do
        @user = FactoryGirl.create(:user)
	end
	
	it "signs me in" do
		visit 'login'
		within("#session") do
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: '123456'
		end
		click_on('Sign in')
		expect(page).to have_content 'Logged in!'
	end
end	
