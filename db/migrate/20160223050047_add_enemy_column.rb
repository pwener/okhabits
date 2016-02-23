class AddEnemyColumn < ActiveRecord::Migration
  def change
    add_column :users, :enemy_id, :integer
  end
end
