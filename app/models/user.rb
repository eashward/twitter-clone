class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :active_relationships, :class_name => 'Relationship', :foreign_key => 'user_id'
  
  has_many: followers
  has_many :passive_relationships, :class_name => 'Relationship', :foreign_key => 'follower_id'

  has_many :following, through: :active_relationships, source: :follower # u.following  => user following
  has_many :followers, through: :passive_relationships, source: :user # u.followers => user followers


  def follow(person)
    active_relationships.create(follower_id: person.id)

  end

  def unfollow(person)
    active_relationships.find_by(follower_id: person.id).destroy

  end

  def is_following?(person)
    following.pluck(:id).include?(person.id)

  end

  def is_followed_by?(person)
    followers.pluck(:id).include?(person.id)
  end
end
