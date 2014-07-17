class CreateAcquisitionunits < ActiveRecord::Migration
  def change
    create_table :acquisitionunits do |t|
      t.string :property
      t.string :unit_number
      t.string :unit_type
      t.string :square_feet
      t.string :rent
      t.string :date

      t.timestamps
    end
  end
end
