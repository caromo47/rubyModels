class User < ActiveRecord::Base
	has_many :friendship, :foreign_key => "user_id", :class_name => "Friendship"
	has_many :friends, :through => :friendships
end
