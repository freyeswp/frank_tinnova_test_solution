class BeersController < ApplicationController
  before_action :authenticate!

  require 'faraday'
  require 'json'

  #Get all beers in table Beer
  def index
    begin
      # Beers of current user
      beers = @current_user.beers

      #Filter by name
      if params[:name].present?
        beers = beers.where(name: params[:name])
      end

      #Filter by abv
      if params[:abv].present?
        beers = beers.where(abv: params[:abv])
      end
      render json: BeerSerializer.new(beers).collection_attr_array
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
      beer.user_id     =@current_user.id
      beer.save!

      render json: BeerSerializer.new(beer).data
    rescue StandardError => e
      message = e.message
    end
  end

  #Add the favorite beer of current user
  def add_favorite_beer
    begin
      #Check current user have a favorite beer
      favorite = @current_user.favorite_beer

      #Have favorite beer ? update : create
      if favorite
        favorite.update!(beer_id: params[:id])
      else
        favorite = FavoriteBeer.new
        favorite.user_id = @current_user.id
        favorite.beer_id = params[:id]
        favorite.save!
      end

      render json: FavoriteBeerSerializer.new(favorite).data
    rescue StandardError => e
      message = e.message
    end
  end

  #Get favorite beer of current user
  def get_favorite_beer
    begin
      favorite = @current_user.favorite_beer
      render json: FavoriteBeerSerializer.new(favorite).data
    rescue StandardError => e
      message = e.message
    end
  end

  def beer_params
    params.require(:beer).permit(:name, :tagline, :description, :abv, :seen_at)
  end
end
