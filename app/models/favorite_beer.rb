class FavoriteBeer < ApplicationRecord
  belongs_to :user
  belongs_to :beer
end
