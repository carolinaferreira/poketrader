class Pokemon < ApplicationRecord
    validates :name, presence: true
	validates :base_experience, presence: true
end
