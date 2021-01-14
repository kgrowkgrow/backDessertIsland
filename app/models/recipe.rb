class Recipe < ApplicationRecord
    has_many :comments
    has_many :favorites
    has_many :users, through: :comments
    has_many :user_favorites, through: :favorites, source: :user
end
