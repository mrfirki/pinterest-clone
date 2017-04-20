require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do

  		# testing active record associations using shoulda-matches
  		context 'associations with dependency' do
	     	it { is_expected.to have_many(:pins).dependent(:destroy)}
	  	end

	  	it "should have username and email and password_digest" do 
	  		should have_db_column(:username).of_type(:string)
	      	should have_db_column(:email).of_type(:string)
	      	should have_db_column(:password_digest).of_type(:string)
	    end

	    describe "validates presence and uniqueness of name and email" do
      		it { is_expected.to validate_presence_of(:email) }
      		it { is_expected.to validate_presence_of(:username) }
      		it { is_expected.to validate_uniqueness_of(:email) }
    	end

    	describe "validates password" do
      		it { is_expected.to validate_presence_of(:password) }
    	end

    	# happy_path
    	describe "can be created when all attributes are present" do
      		When(:user) { User.create(
        		username: "Raz",
        		email: "Raz@nextacademy.com",
        		password: "123456"
      			)}
      		Then { expect(user).to be_valid }
    	end

    	# unhappy_path
	    describe "cannot be created without a name" do
		    When(:user) { User.create(
		    	email: "sheng@nextacademy.com",
		    	password: "123456") }
		    Then { user.valid? == false }
	    end

	    describe "cannot be created without a email" do
	      	When(:user) { User.create(
	      		username: "cysheng",
	      		password: "123456") }
	      	Then { user.valid? == false }
	    end


	    describe "cannot be created without a password" do
	      	When(:user) { User.create(
	      		username: "cysheng",
	      		email: "sheng@nextacademy.com") }
	      	Then { user.valid? == false }
	    end

	    describe "should permit valid email only" do
	      	let(:user1) { User.create(username: "Tom", email: "tom@nextacademy.com", password: "123456")}
	      	let(:user2) { User.create(username: "nathalie",email: "nathalie.com", password: "123456") }

	      	# happy_path
	      	it "sign up with valid email" do
	        	expect(user1).to be_valid
	      	end

	      	# unhappy_path
	      	it "sign up with invalid email" do
	        	expect(user2).to be_invalid
	      	end
	    end
	end	
end  	

