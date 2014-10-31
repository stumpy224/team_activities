class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :member_id
      t.integer :nomination_id
      t.integer :points

      t.timestamps
    end
  end
end
