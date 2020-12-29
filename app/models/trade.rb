class Trade < ApplicationRecord
    validates :player_id_1, presence: true
    validates :player_id_2, presence: true
    validates :offer_player_1, presence: true
    validates :offer_player_2, presence: true 
end
