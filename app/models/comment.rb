class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :usr_comment, polymorphic: true
end
