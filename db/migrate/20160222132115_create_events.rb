class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type_id
      t.datetime :happen_in

      t.timestamps null: false
    end
  end
end
