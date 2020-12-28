class Trade < ApplicationRecord
    validates :players, presence: true
    validates :is_fair, presence: true
end
