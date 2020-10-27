module PostfollowHelper

  def is_user_follow_post?(user_id, post_id)
    PostFollow.where("user_id = ? AND post_id = ?", user_id, post_id).count == 1
  end

end
