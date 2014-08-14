class ChangeInspections < ActiveRecord::Migration
  def change
    rename_column :inspections, :granite, :new_countertop
    add_column :inspections, :paint, :boolean
  end
end
