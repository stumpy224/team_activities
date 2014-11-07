class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
