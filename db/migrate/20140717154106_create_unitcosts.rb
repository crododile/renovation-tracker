class CreateUnitcosts < ActiveRecord::Migration
  def change
    create_table :unitcosts do |t|
      t.string :property
      t.string :unit
      t.string :cost
      t.string :budget
      t.string :date

      t.timestamps
    end
  end
end
