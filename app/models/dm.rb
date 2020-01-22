class Dm < ApplicationRecord
  has_many :notes, as: :notable
  has_one :game
end
