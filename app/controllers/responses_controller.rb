class ResponsesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @response = @post.response.create(responses_params)
        @response.user_id = current_user.id
        @response.save

        MailJob.perform_later @response[:id]
        redirect_to @post
    end
    
    def new
        @response = Response.new
    end

    private
        def responses_params
            params.require(:response).permit(:content, :user_id)
        end

end
