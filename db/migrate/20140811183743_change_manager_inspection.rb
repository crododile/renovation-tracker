class ChangeManagerInspection < ActiveRecord::Migration
  def change
    add_column :manager_inspections, :currentunit_id, :integer
  end
end
