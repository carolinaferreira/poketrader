class RemoveColumnsFromTrades < ActiveRecord::Migration[6.1]
  def change
    remove_column :trades, :player_id_1, :integer
    remove_column :trades, :player_id_2, :integer
  end
end
