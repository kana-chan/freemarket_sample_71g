class AddAreaToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :area, :string, null:false
  end
end
