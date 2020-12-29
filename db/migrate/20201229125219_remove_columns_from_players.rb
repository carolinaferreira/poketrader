class RemoveColumnsFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :offer, :text
    remove_column :players, :total_experience, :integer
  end
end
