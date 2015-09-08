class UsersController < ApplicationController 
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	# GET /users
	def index
		@users = User.all;
	end
	
	# GET /users/1
	def show
		
	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
		
	end

	# POST /users
	def create
		@user = User.new(user_params)

		respond_to do |f|
			if @user.save
				f.html { redirect_to @user, notice: 'User was successfully created.' }
				f.json { render :show, status: :created, location: @user }
			else
				f.html { render :new }
				f.json { render json: @user.errors, status: :unprocessable_entity }	
			end
		end
	end

	# PATCH/PUT /users/1
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: @user } 
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end

end
