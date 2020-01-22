class CharacterSheet < ApplicationRecord
    validates :name, presence: true, length:{minimum: 3, maximum:25}
end
