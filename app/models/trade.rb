class Trade < ApplicationRecord
    belongs_to :player_1, class_name: 'Player', foreign_key: 'player_1_id' 
    belongs_to :player_2, class_name: 'Player', foreign_key: 'player_2_id'
    
    validates :player_1_id, presence: true
    validates :player_2_id, presence: true
    validates :offer_player_1, presence: true
    validates :offer_player_2, presence: true  
end