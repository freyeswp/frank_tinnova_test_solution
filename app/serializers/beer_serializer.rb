class BeerSerializer < MainSerializer
  attributes(:id, :name, :tagline, :description, :abv, :seen_at)

  attribute :seen_at do |beer|
    {
      time: beer.seen_at.strftime("%H:%M:%S"),
      date: beer.seen_at.strftime("%d/%m/%Y")
    }
  end

  attribute :favorite do |beer|

    favorite_beer = beer.favorite_beer

    if beer.favorite_beer
      favorite_beer = true
    else
      favorite_beer =  false
    end

  end
end
