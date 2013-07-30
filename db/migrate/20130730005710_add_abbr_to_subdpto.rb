class AddAbbrToSubdpto < ActiveRecord::Migration
  def change
    add_column :subdptos, :abbr, :string
  end
end
