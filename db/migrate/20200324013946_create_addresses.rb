class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_furigana
      t.string :first_furigana
      t.string :zip
      t.integer :prefecture_id
      t.string :city
      t.string :street
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
