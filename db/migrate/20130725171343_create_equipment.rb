class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :dpto_id
      t.integer :subdpto_id
      t.string :sort

      t.timestamps
    end
  end
end
