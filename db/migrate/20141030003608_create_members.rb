class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :identifier
      t.string :name
      t.boolean :active

      t.timestamps
    end

    add_index :members, :identifier, unique: true
  end
end
