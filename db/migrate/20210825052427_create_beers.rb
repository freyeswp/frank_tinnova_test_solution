class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :tagline
      t.string :description
      t.decimal :abv
      t.datetime :seen_at

      t.timestamps
    end
  end
end
