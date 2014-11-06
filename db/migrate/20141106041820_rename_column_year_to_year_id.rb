class RenameColumnYearToYearId < ActiveRecord::Migration
  def change
    rename_column :nominations, :year, :year_id
  end
end
