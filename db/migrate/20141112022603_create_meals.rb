class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :member_id
      t.boolean :dinner_indicator

      t.timestamps
    end
  end
end
