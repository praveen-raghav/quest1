class Post < ActiveRecord::Base
  has_many :response, dependent: :destroy
  has_many :comments, as: :usr_comment, dependent: :destroy
  has_many :post_follows, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  after_create :follow_post

  def follow_post
    follow = PostFollow.create(:user_id => self.user_id, :post_id => self.id)
    follow.save
  end

end
