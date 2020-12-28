class Player < ApplicationRecord
    validates :name, presence: true
    validates :offer, presence: true
    validates :total_experience, presence: true
end
