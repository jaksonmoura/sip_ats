class AddAbbrToDpto < ActiveRecord::Migration
  def change
    add_column :dptos, :abbr, :string
  end
end
