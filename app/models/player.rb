class Player < ApplicationRecord
  has_many :notes, as: :notable
end
