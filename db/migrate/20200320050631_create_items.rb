class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.string :explaination, null:false
      t.integer :condition_id, null:false 
      t.integer :shipment_id, null:false
      t.integer :responsibility_id, null:false
      t.integer :price, null:false
      t.integer :prefecture_id, null:false
      t.references :user, foreign_key: true
      t.references :seller, foreign_key: {to_table: :users} 
      t.references :buyer, foreign_key: {to_table: :users}
      t.string :brand
      t.timestamps
    end
  end
end