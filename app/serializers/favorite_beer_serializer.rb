class FavoriteBeerSerializer < MainSerializer
  attributes(:id)

  attribute :user do |favorite_beer|
    {
      name: favorite_beer.user.name,
      last_name: favorite_beer.user.last_name,
      username: favorite_beer.user.username
    }
  end

  attribute :beer do |favorite_beer|
    {
      name: favorite_beer.beer.name,
      tagline: favorite_beer.beer.tagline,
      description: favorite_beer.beer.description,
      abv: favorite_beer.beer.abv
    }
  end
end
