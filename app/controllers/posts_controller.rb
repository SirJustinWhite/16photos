class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@post = Post.new
	end

	def create
		if @post = Post.create(post_params)
			flash[:success] = "Post Created"
			redirect_to posts_path
		else
			flash.now[:alert] = "UH-OH! Something went wrong and your picture couldn't be uploaded!"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post edited!"
			redirect_to posts_path
		else
			flash.now[:alert] = "Update failed!"
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:alert] = "Post Deleted!"
		redirect_to posts_path
	end



		private

		def post_params
			params.require(:post).permit(:image, :caption)
		end

		def set_post
			@post = Post.find(params[:id])
		end


end
