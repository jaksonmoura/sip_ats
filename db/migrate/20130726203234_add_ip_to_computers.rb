class AddIpToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :ip, :integer
  end
end
