class AddLastFuriganaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_furigana, :string
  end
end
