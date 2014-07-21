class DropUnitCosts < ActiveRecord::Migration
  def change
    drop_table :unitcosts
  end
end
