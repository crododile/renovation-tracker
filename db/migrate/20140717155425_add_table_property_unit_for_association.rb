class AddTablePropertyUnitForAssociation < ActiveRecord::Migration
  def change
    create_table :properties_currentunits, :id => false do |t|
        t.belongs_to :properties
        t.belongs_to :units
    end
  end
end
