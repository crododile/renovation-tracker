class CreateProductionschedules < ActiveRecord::Migration
  def change
    create_table :productionschedules do |t|
      t.string :property
      t.string :unit
      t.string :componentrehabdate
      t.string :floorapplirehabdate
      t.string :blank

      t.timestamps
    end
  end
end
