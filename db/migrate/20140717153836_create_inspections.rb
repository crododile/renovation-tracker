class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :property
      t.string :unit_number
      t.string :inspector
      t.string :occupied_rehab
      t.string :turn_rehab
      t.string :inspection_date
      t.string :attachments
      t.string :comments

      t.timestamps
    end
  end
end
