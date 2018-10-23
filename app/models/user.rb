class User < ApplicationRecord
  has_many :blog_posts, foreign_key: 'users_id'
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

end
