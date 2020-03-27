class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip, null:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :street, null:false
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
