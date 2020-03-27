class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :explaination
      t.integer :condition_id
      t.integer :shipment_id
      t.integer :responsibility_id
      t.integer :price
      t.integer :prefecture_id
      t.string :brand
      t.timestamps
    end
  end
end