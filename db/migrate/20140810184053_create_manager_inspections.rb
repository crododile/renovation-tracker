class CreateManagerInspections < ActiveRecord::Migration
  def change
    create_table :manager_inspections do |t|
      t.boolean :components
      t.boolean :new_countertop
      t.boolean :flooring
      t.boolean :appliances
      t.boolean :paint
      t.boolean :rent_ready
      t.string :property
      t.string :unit_number

      t.timestamps
    end
  end
end
