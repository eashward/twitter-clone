class Relationship < ActiveRecord::Base
  belongs_to :user  #relationship.user => user_id
  belongs_to :follower, :class_name => 'User' #relationship.follower => follower_id

  validates :user_id, :follower_id, presence: true
end
