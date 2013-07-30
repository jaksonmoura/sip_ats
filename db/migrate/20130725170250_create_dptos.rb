class CreateDptos < ActiveRecord::Migration
  def change
    create_table :dptos do |t|
      t.string :name

      t.timestamps
    end
  end
end
