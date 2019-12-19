class Publics::PostsController < ApplicationController
	before_action :authenticate_user!

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		redirect_to publics_user_posts_path
	end

	def index
		@user = User.find(params[:user_id])
		@posts = Post.where(user_id:@user.id)
		@comments = Comment.all
	end

	def show
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	private
		def post_params
			params.require(:post).permit(:user_id, :post_image, :post_content)
		end
end
