class NotificationMailer < ApplicationMailer
    default from: "mail@gmail.com"

    def notification_email(receiver_email, user_name, title)
        @usr_name = user_name
        @post_title = title
        mail(to: receiver_email, subject: 'New response')
    end
end
