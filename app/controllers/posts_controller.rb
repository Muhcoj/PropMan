class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.order('created_at DESC').page(params[:page]).per(5)

		@open_invoices = Finance.where(status: 'open')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post, notice: "Your post was created successfully."
		else
			render :new
		end
	end


	def edit	
	end

	def update
  	if @post.update(post_params)
  		redirect_to @post, notice: 'Your post was updated successfully'
  	else
  		render :edit
  	end
	end


	def show
	end

	def destroy
		@post.delete
		redirect_to posts_path, notice: 'Your post was deleted successfully'
	end

	private

		def post_params
			params.require(:post).permit(:title, :description)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
