class PostsController < ApplicationController
	def index
      @posts = Post.all.order('created_at DESC')
	end

	def new
	end

	def create
	  @post = Post.new{post_params}
	  @post.save

	  redirect_to @post
	end

	def show
	  @post = Post.find(params[:id])
	end
      

  private
    def post_params #define strong params in rails 4
		params.require(:post).permit(:title, :body)
	end

end

