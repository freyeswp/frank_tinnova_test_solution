class AddUserToFavoriteBeer < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorite_beers, :user, foreign_key: true
  end
end
