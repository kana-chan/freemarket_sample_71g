class Item < ApplicationRecord
  validates :name, :explaination, :conditon, :date, :shipping_method, :cost, :responsibility, :price, presence: true
end
