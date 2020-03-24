class AddFirstFuriganaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_furigana, :string
  end
end
