class FixEstimateColumnInProblems < ActiveRecord::Migration
  def change
    rename_column :problems, :esimate_id, :estimate_id
  end
end
