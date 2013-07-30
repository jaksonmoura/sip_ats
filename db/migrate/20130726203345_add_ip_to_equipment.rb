class AddIpToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :ip, :integer
  end
end
