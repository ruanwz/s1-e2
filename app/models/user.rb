class User < ActiveRecord::Base
  has_many :repositories
  has_many :commits
  has_many :comments
  has_many :issues
  has_many :pull_commits
  has_many :pull_requests
  has_many :watchings
  
  has_many :followings
  has_many :followers, :through=> :followings
  has_many :following_people_connections, :class_name => "Following", :foreign_key =>"follower_id"
  has_many :following_people, :through=> :following_people_connections, :source => :user

end
