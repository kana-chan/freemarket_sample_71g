class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building_name, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
