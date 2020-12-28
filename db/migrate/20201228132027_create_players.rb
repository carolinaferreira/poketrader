class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.text :offer, array: true, default: []
      t.integer :total_experience

      t.timestamps
    end
  end
end
