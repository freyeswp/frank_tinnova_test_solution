class User < ApplicationRecord
  has_secure_password

  has_many :beers, dependent: :destroy
  has_one :favorite_beer

  def to_token
    {
        id: self.id,
        name: self.name,
        username: self.username,
    }
  end
end
