class User < ApplicationRecord
    has_many :comments
    has_many :favorites
    has_many :likes
    has_many :recipes, through: :comments
    has_many :favorite_recipes, through: :favorites, source: :recipes
    has_many :liked_comments, through: :likes, source: :comments
end
