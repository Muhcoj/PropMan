class HomePostsController < ApplicationController
	before_action :set_post, only: [:show]

	def index
		@home_posts = HomePost.all
	end

	def new
		@home_post = HomePost.new
	end

	def create
	  @home_post = HomePost.new(home_post_params)

	  if @home_post.save
			redirect_to @home_post, notice: "Your home post was created successfully."
		else
			render :new
		end
	end

	def show
	end


	private

	def home_post_params
			params.require(:home_post).permit(:title, :date, :description)
		end

		def set_post
			@home_post = HomePost.find(params[:id])
		end
end