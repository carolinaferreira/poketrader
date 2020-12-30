class AddReferencesToTrades < ActiveRecord::Migration[6.1]
  def change
    add_reference :trades, :player_1, null: false, foreign_key: {to_table: :players}, index: true
    add_reference :trades, :player_2, null: false, foreign_key: {to_table: :players}, index: true
  end
end
