class User < ApplicationRecord
    has_many :comments
    has_many :favorites
    has_many :likes
    has_many :recipes, through: :comments
    has_many :favorite_recipes, through: :favorites, source: :recipe
    has_many :liked_comments, through: :likes, source: :comment

    has_secure_password
end
