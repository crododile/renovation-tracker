class AddRentReadyToCovenantInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :rent_ready, :boolean
  end
end
