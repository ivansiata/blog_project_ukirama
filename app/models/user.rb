class User < ApplicationRecord
  has_many :blog_posts, foreign_key: 'users_id'
end
