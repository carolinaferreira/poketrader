class RemovePlayersFromTrades < ActiveRecord::Migration[6.1]
  def change
    remove_column :trades, :players, :text
  end
end
