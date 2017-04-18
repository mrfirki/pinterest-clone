class UsersController < ApplicationController

	  def new
    	@user = User.new
  	end

  	def create
    	@user = User.new(user_params)	
    	if @user.save
    		session[:user_id] = @user.id
      	redirect_to users_path, notice: 'Thank you for signing up!'
    	else
      	render :new
    	end
  	end

    def show
      @user = User.find(params[:id])
    end
    
    def edit
      @user = User.find(params[:id])
    end  

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "update success!!"
        render :show
      else
        flash[:danger] = "update fail!!"
        render  :edit
      end 
    end

    def delete
      @user = User.find_by(params[:id])
      @user.destroy
      redirect_to '/'
    end  


  	private

  	def user_params
    	params.require(:user).permit(:username, :email, :password)
  	end
end

