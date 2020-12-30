class Player < ApplicationRecord
    has_many :trade_as_player_1, class_name: 'Trade', foreign_key: 'player_1_id'
    has_many :trade_as_player_2, class_name: 'Trade', foreign_key: 'player_2_id'

    validates :name, presence: true
end
