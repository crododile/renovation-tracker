class CreateImageTable < ActiveRecord::Migration
  def change
    create_table :inspection_images do |t|
      t.integer :inspection_id
      t.attachment :inspection_photo
      
      t.timestamps
    end
  end
end
