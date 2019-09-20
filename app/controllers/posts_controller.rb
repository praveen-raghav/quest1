class PostsController < ApplicationController

    before_action :authenticate_user!, only: [:show, :create, :new]

    def new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
        @response = Response.new
    end

    def index
        @posts = Post.all
    end

    def destroy
        Post.where("id="+params[:id]).destroy_all
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:posts).permit(:title, :content, :user_id, :topic_id)
        end

end
