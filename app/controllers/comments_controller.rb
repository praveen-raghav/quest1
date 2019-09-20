class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        if(params.has_key?(:response_id))
            @response = @post.response.find(params[:response_id])
            @comment = @response.comments.create(comments_params)
        else
            @comment = @post.comments.create(comments_params)
        end
            @comment.user_id = current_user.id
            @comment.save
        redirect_to @post
    end

    private
    def comments_params
        params.require(:comment).permit(:comment, :usr_comment_id, :usr_comment_type, :user_id)
    end
end
