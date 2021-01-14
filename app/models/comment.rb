class Comment < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  belongs_to :user
  belongs_to :recipe
end
