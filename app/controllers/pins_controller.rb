class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy,]

	def index
		@pins = Pin.where(user_id: params[:user_id])	
	end

	# def show
	# 	@pins = Pin.find(params[:id])
	# end

	def new
		@pin = Pin.new
	end

	def create
		@pin = current_user.pins.new(pin_params)
		if @pin.save
			flash[:success] = "Success create pin!"
			redirect_to root_path
		else
			flash[:danger] = "Please fill the form!"
			render 'new'
		end
	end

	def edit
		@pins = Pin.find(params[:id])
	end

	def update
		@pin = Pin.find(params[:id])
		if @pin.update(pin_params)
			flash[:success] = "success updated pin!"
			redirect_to root_path
		else
			flash[:danger] = "sorry try again"
			render 'edit'
		end	
	end

	def destroy
		@pin = Pin.find(params[:id])
		@pin.destroy
		redirect_to root_path
	end


	private

	def pin_params
		params.require(:pin).permit(:title, :description)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_pin
		@pin = current_user.pins.find(params[:id])
		# current_user.pins.find_by(user_id: params[:id])
	end

	
end

