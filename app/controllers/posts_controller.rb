class PostsController < ApplicationController
	
	
	def index
      @posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)

	  if @post.save
		redirect_to @post, :notice =>"Your post was saved"
	  else
			render 'new'
	  end 
	end

	def show
	  @post = Post.find(params[:id])#find particular post by passing params hash id.
	 
	end
      
    def edit
       @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])#same as the edit action, find the post to update using the params to grab the id.

	    if @post.update(params[:post].permit(:title,:body))
		redirect_to @post, :notice =>"Post updated"
        else
	      render 'edit'
        end
    end
    
    def destroy
    	@post = Post.find(params[:id])
    	@post.destroy

    	redirect_to root_path
    end
    
	  private
	    def post_params
			params.require(:post).permit(:title, :body)
		end
end

