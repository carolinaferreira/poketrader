module Api
	module V1
		class PokemonsController < ApplicationController   
			def index
				@pokemons = Pokemon.all
				serializer = PokemonSerializer.new(@pokemons)
				
				render json: serializer.serialize_with_pagination(params[:page]), status: :ok
			end
        end
	end
end