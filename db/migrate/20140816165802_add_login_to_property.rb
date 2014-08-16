class AddLoginToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :login, :string
  end
end
