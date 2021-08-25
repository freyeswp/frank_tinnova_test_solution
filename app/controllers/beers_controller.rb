class BeersController < ApplicationController
  before_action :authenticate!

  require 'faraday'
  require 'json'

  #Get all beers in table Beer
  def index
    begin

    rescue StandardError => e
        message = e.message
    end
  end

  #Get a single beer
  def show
    begin
      #Get the beer indicate by params[:id] in Punk API
      url = "https://api.punkapi.com/v2/beers/#{params[:id]}"
      response = Faraday.get(url)

      #Convert to JSON the response body
      data = JSON.parse(response.body)

      #Create the new
      beer             = Beer.new
      beer.name        = data[0]["name"]
      beer.tagline     = data[0]["tagline"]
      beer.description = data[0]["description"]
      beer.abv         = data[0]["abv"]
      beer.seen_at     = DateTime.now
      beer.save!

      payload = {beer: BeerSerializer.new(beer).data}
      render json: payload
    rescue StandardError => e
      message = e.message
    end
  end

  def beer_params
    params.require(:beer).permit(:name, :tagline, :description, :abv, :seen_at)
  end
end
