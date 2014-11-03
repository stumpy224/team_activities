class AddIndexToMembersIdentifier < ActiveRecord::Migration
  def change
    add_index :members, :identifier, unique: true
  end
end
