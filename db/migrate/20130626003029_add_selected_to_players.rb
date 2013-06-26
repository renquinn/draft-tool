class AddSelectedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :selected, :boolean, :default => false
  end
end
