module Api
	module V1
		class PokemonsController < ApplicationController   
			def index
				@pokemons = Pokemon.all
				render json: {status: 'SUCCESS', message:'Loaded Pokemons', count: Pokemon.count, data:@pokemons},status: :ok
			end
        end
	end
end