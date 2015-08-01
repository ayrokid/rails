class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:author, :body))
<<<<<<< HEAD

=======
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
		redirect_to post_path(@post)
	end
end
