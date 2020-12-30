module Api
	module V1
		class PlayersController < ApplicationController   
			def index
				@players = Player.all
				render json: {status: 'SUCCESS', message:'Loaded Players', count: Player.count, data:@players},status: :ok
			end

			def create
				@player = Player.new(player_params)
				if @player.save
					render json: {status: 'SUCCESS', message:'Saved player', data: @player},status: :ok
				else
					render json: {status: 'ERROR', message:'Player not saved', data: @player.erros},status: :unprocessable_entity
				end
			end

			private
			def player_params
				params.permit(:name)
			end
        end
	end
end