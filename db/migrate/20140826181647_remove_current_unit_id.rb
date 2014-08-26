class RemoveCurrentUnitId < ActiveRecord::Migration
  def change
    remove_column :manager_inspections, :currentunit_id, :integer
  end
end
