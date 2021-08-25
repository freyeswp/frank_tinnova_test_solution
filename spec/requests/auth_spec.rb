require 'rails_helper'

payload = {
  user: {
    username: "admin",
    password: "admin"
  }
}

#login
describe 'POST Login', type: :request do
  #FactoryBot.create(:user, name: 'Admin', last_name: 'Admin', username: 'admin', email: 'admin@factoro_test.com', password: 'admin', password_confirmation: 'admin')
  it 'return session' do
    post '/auth/login', params:payload

    expect(response).to have_http_status(:success)
  end
end