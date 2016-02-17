class RenameRecipeParameter < ActiveRecord::Migration
  def change
    rename_column :recipes, :preparation_time_in_sec, :preparation_time_in_min
  end
end
