class BlogPost < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  validates :users_id, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
end
