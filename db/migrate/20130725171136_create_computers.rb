class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.integer :dpto_id
      t.integer :subdpto_id
      t.string :sort
      t.string :name

      t.timestamps
    end
  end
end
