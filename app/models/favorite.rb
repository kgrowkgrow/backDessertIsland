class Favorite < ApplicationRecord
  belongs_to :user_id
  belongs_to :recipe_id
end
