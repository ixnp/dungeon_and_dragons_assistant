class Game < ApplicationRecord
  has_many :notes, as: :notable
  has_many :user_games
  has_many :users, through: :user_games
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
end
