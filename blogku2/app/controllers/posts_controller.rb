#app/controllers/posts_controller.rb

class PostsController < ApplicationController
	before_action :signed_in_admin, only: [:new, :create]

	def index
		@posts =Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 2)
	end

	def new
		
	end

	def create
		@post = Post.new(post_params)

		respond_to do |format|
			if @post.save
				flash[:success] = 'Article was successfully created.'
				format.html { redirect_to posts_path }
			else
				flash[:danger]  = 'There was a problem creating the article.'
				format.html { render :new }
			end
		end
	end

	def update
		@post = Post.find(params[:id])
		respond_to do |format|
			if @post.update_attributes(post_params)
				flash[:success] = 'Article was successfully updated.'
				format.html { redirect_to posts_path }
			else
				flash[:danger] = 'There was a problem updating the Article.'
				format.html { render :edit }
			end
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		respond_to do |format|
			flash[:success] = 'Article was successfully destroyed.'
			format.html { redirect_to posts_path }
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	private 
	def post_params
		params.require(:post).permit(:title, :body)
	end

	#Before filters
	def signed_in_admin
		unless admin?
			store_location
			redirect_to signin_url, notice: 'Area Khusus Admin'
		end
		
	end

end
