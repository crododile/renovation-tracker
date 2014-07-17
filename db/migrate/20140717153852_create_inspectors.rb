class CreateInspectors < ActiveRecord::Migration
  def change
    create_table :inspectors do |t|
      t.string :inspector

      t.timestamps
    end
  end
end
