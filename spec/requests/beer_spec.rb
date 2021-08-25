require 'rails_helper'

#Get all the beers in the DB
describe 'GET Beers', type: :request do
  it 'return all beers of the current user' do
    get '/beers', :headers => {'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk4OTgzNDQsImlkIjoxLCJuYW1lIjoiQWRtaW4iLCJ1c2VybmFtZSI6ImFkbWluIn0.0AEJ-sO3Egqew63Z254uYnZTOa4l2Ihe57aJJiXQ6x8'}
    expect(response).to have_http_status(:success)
  end
end

#Get an specific beer
describe "GET Beers", type: :request do
  it 'return an specific beer' do
    get '/beers/3', :headers => {'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk4OTgzNDQsImlkIjoxLCJuYW1lIjoiQWRtaW4iLCJ1c2VybmFtZSI6ImFkbWluIn0.0AEJ-sO3Egqew63Z254uYnZTOa4l2Ihe57aJJiXQ6x8'}
    expect(response).to have_http_status(:success)
  end
end

describe "POST favorite beer", type: :request do
  it 'add a favorite beer of the current user' do
    post '/beers/1/favorite', :headers => {'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk4OTgzNDQsImlkIjoxLCJuYW1lIjoiQWRtaW4iLCJ1c2VybmFtZSI6ImFkbWluIn0.0AEJ-sO3Egqew63Z254uYnZTOa4l2Ihe57aJJiXQ6x8'}
    expect(response).to have_http_status(:success)
  end
end

describe "GET favorite beer", type: :request do
  it 'get the favorite beer of the current user' do
    get '/favorite_beer', :headers => {'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk4OTgzNDQsImlkIjoxLCJuYW1lIjoiQWRtaW4iLCJ1c2VybmFtZSI6ImFkbWluIn0.0AEJ-sO3Egqew63Z254uYnZTOa4l2Ihe57aJJiXQ6x8'}
    expect(response).to have_http_status(:success)
  end
end