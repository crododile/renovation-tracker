class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :fund
      t.string :manager
      t.string :property
      t.string :units
      t.string :city
      t.string :state
      t.string :purchase_price
      t.string :twophaserehab

      t.timestamps
    end
  end
end
