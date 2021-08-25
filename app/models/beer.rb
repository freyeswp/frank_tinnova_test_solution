class Beer < ApplicationRecord
  belongs_to :user

  has_one :favorite_beer
end
