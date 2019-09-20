class Response < ActiveRecord::Base
  belongs_to :post
  has_many :comments, as: :usr_comment, dependent: :destroy
end
