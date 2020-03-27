class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :responsibility
  belongs_to_active_hash :shipment
end