class CreateCutoffs < ActiveRecord::Migration
  def change
    create_table :cutoffs do |t|
      t.datetime :cutoff_at

      t.timestamps null: false
    end
  end
end
