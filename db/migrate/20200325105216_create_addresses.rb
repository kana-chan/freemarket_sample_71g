class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building_name
      t.string :phone_number_ad
      t.string :first_name_ad
      t.string :last_name_ad
      t.string :first_furigana_ad
      t.string :last_furigana_ad
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
