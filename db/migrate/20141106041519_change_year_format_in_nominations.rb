class ChangeYearFormatInNominations < ActiveRecord::Migration
  def change
    change_column :nominations, :year, :integer
  end
end
