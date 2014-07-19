class ChangeInspectionFields < ActiveRecord::Migration
  def change
    remove_column :inspections, :occupied_rehab, :string
    remove_column :inspections, :turn_rehab, :string
    add_column :inspections, :components, :boolean
    add_column :inspections, :granite, :boolean
    add_column :inspections, :flooring, :boolean
    add_column :inspections, :appliances, :boolean
  end
end
