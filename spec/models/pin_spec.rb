require 'rails_helper'

RSpec.describe Pin, type: :model do
  context "validations" do

	  	it "should have title and description" do
	  		should have_db_column(:title).of_type(:string)
	  		should have_db_column(:description).of_type(:string)
	  	end

	  	it "should have user_id" do
	  		should have_db_column(:user_id).of_type(:integer)
	  	end	
	  	
	  	describe "validates presence of title and description" do
	  		it { is_expected.to validate_presence_of(:title) }
	  		it { is_expected.to validate_presence_of(:description) }
	  	end
	  	
	  	#happy_path
	   	describe "can be created when all attributes are present" do
	   		When(:pin) { Pin.create(
	   			title: "hello",
	   			description: "hello world",
	   			user_id: create(:user).id
	   			)}
	   		Then { expect(pin).to be_valid }
	   	end

	   	#unhappy path
	   	describe "cannot be created without a name" do
	   		When(:pin) { Pin.create(
	   			description: "hello world",
	   			user_id: create(:user).id
	   			)}
	   		Then { pin.valid? == false }
	   	end
	   	
	   	describe "cannot be created without a description" do
	   		When(:pin) { Pin.create(
	   			title: "hello",
	   			user_id: create(:user).id
	   			)}
	   		Then { pin.valid? == false }
	   	end

	   	describe "cannot be created without a user_id" do
			When(:pin) { Pin.create(
				title: "hello",
				description: "hello world"
				)}
			Then { pin.valid? == false }
		end					
	end   		
end
