class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC').paginate(page:params[:page], per_page: 2)
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to root_url
	end

	def show
		@post = Post.find(params[:id])
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)			
		end
end
