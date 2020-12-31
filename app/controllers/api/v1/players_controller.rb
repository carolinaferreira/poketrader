module Api
	module V1
		class PlayersController < ApplicationController   
			def index
				@players = Player.all
				serializer = PlayerSerializer.new(@players)
				
				render json: serializer.serialize_with_pagination(params[:page]), status: :ok
			end

			def create
				@player = Player.new(player_params)
				if @player.save
					serializer = PlayerSerializer.new(@player)
					render json: serializer.serialize, status: :created	
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