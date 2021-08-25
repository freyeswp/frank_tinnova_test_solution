class AddBeerToFavoriteBeer < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorite_beers, :beer, foreign_key: true
  end
end
