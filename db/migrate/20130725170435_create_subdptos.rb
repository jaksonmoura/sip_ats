class CreateSubdptos < ActiveRecord::Migration
  def change
    create_table :subdptos do |t|
      t.string :name
      t.integer :dpto_id

      t.timestamps
    end
  end
end
