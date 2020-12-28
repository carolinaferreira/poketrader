module Api
	module V1
		class TradesController < ApplicationController   
			def index
				@trades = Trade.all
				render json: {status: 'SUCCESS', message:'Loaded Trades', count: Trade.count, data:@trades},status: :ok
            end
            

			def create
				@trade = Trade.new(trade_params)
				if @trade.save
					render json: {status: 'SUCCESS', message:'Saved trade', data: @trade},status: :ok
				else
					render json: {status: 'ERROR', message:'Trade not saved', data: @trade.erros},status: :unprocessable_entity
				end
			end

			private
			def trade_params
				params.permit(:is_fair, players:[:id, :name, :offer, :total_experience])
			end
        end
	end
end