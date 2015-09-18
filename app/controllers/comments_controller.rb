class CommentsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = @product.comments.new(comment_params)
        @comment.user = current_user		
        if @comment.save
            redirect_to root_path
        else
            flash.now[:error] = "Your comment did not save!"
            render 'comments/_comment'
        end
	end

	def show
	end

	def destroy
		@comment = Comment.find(params[:id])
		post = @comment.post
		@comment.destroy

		redirect_to post_path
	end
end
