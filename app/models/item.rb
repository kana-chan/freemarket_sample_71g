class Item < ApplicationRecord
  validates :name, :explaination, :conditon, :date, :shipping_method, :cost, :responsibility, :price, presence: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
