require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:valid_params) {{ username: "Josh Teng", email: "josh@na.com", password: "123456"}}
  	let(:invalid_params) {{ username: "Josh Teng", email: "joshna.com", password: "123456"}}

  	describe "GET #new" do
	    before do
	      get :new
	    end

	    it "returns http success" do
      		expect(response).to have_http_status(:success)
    	end
	end

	describe "POST #create" do
	    # happy_path
	    context "valid_params" do
	      it "creates new user if params are correct" do
	        expect {post :create, :user => valid_params}.to change(User, :count).by(1)
	      end
	    end
	end

end
