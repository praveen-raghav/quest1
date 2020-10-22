class MailJob < ActiveJob::Base
  queue_as :default

  def perform(response_id)
    @response = Response.find(response_id)
    post_id = @response[:post_id]
    @users = User.joins("INNER JOIN post_follows ON users.id = post_follows.user_id").where("post_follows.post_id="+post_id.to_s)
    post_title = Post.find(post_id)[:title]
# merge PR
    @users.each do |eachuser|

      #if the user replying also follows post, do not send mail this particular user
      if(eachuser[:id] != @response[:user_id])
        NotificationMailer.notification_email(eachuser[:email], eachuser[:name], post_title).deliver_now
      end

    end

  end
end
