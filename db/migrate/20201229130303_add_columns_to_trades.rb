class AddColumnsToTrades < ActiveRecord::Migration[6.1]
  def change
    add_column :trades, :player_id_1, :integer
    add_column :trades, :player_id_2, :integer
    add_column :trades, :offer_player_1, :string, array: true, default: []
    add_column :trades, :offer_player_2, :string, array: true, default: []
    add_column :trades, :offer_1_experience, :integer
    add_column :trades, :offer_2_experience, :integer
  end
end
