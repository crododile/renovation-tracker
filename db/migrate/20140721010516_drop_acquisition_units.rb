class DropAcquisitionUnits < ActiveRecord::Migration
  def change
    drop_table :acquisitionunits
  end
end
