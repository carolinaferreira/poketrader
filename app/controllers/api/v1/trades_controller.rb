module Api
	module V1
		class TradesController < ApplicationController   
			def index
				@trades = Trade.order('created_at DESC').all
				serializer = TradeSerializer.new(@trades)
				
				render json: serializer.serialize_with_pagination(params[:page]), status: :ok
            end
            

			def create
				@trade = Trade.new(trade_params)
				create_players

				offer_1_experience = calculate_offer_experience(trade_params['offer_player_1'], 'offer_player_1' )
				offer_2_experience = calculate_offer_experience(trade_params['offer_player_2'], 'offer_player_2')
				@trade['offer_1_experience'] = offer_1_experience
				@trade['offer_2_experience'] = offer_2_experience
				@trade['is_fair'] = calculate_is_fair(offer_1_experience, offer_2_experience)
				if @trade.save
					serializer = TradeSerializer.new(@trade)
					render json: serializer.serialize, status: :created
				else
					render json: {status: 'ERROR', message:'Trade not saved', data: @trade.errors},status: :unprocessable_entity
				end
			end

			def calculate_offer_experience(offer_player, trade_offer)
				offer_experience = 0

				offer_array = Pokemon.where(name: offer_player)

				offer_array.each do |pokemon|
					offer_experience += pokemon['base_experience'].to_i
				end

				@trade[trade_offer] = offer_array
				offer_experience
			end

			def calculate_is_fair(offer_1_experience, offer_2_experience)
				is_fair = (offer_1_experience - offer_2_experience).abs >= 2

				is_fair
			end

			private
			def trade_params
				params.permit(
					offer_player_1: [],
					offer_player_2: [])
			end

			def create_players
				player_1 = Player.create(name: params['player_1_name'])
				player_2 = Player.create(name: params['player_2_name'])
				@trade['player_1_id'] = player_1['id']
				@trade['player_2_id'] = player_2['id']
			end

        end
	end
end