class BeerSerializer < MainSerializer
  attributes(:id, :name, :tagline, :description, :abv, :seen_at)

  attribute :seen_at do |beer|
    {
      time: beer.seen_at.strftime("%H:%M:%S"),
      date: beer.seen_at.strftime("%d/%m/%Y")
    }
  end
end
