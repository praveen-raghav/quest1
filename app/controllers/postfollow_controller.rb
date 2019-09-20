class PostfollowController < ApplicationController
    def create
        followrow = {:user_id => current_user.id, :post_id => params[:post_id]}
        f = PostFollow.create(followrow)
        f.save
        MailJob.perform_later
        redirect_to Post.find(params[:post_id])
    end

    def destroy
        PostFollow.where("user_id = ? AND post_id = ?", current_user.id, params[:id]).destroy_all
        redirect_to Post.find(params[:id])
    end
end
