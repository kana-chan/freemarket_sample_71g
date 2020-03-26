class Item < ApplicationRecord
  validates :name, :explaination, :condition_id, :shipment_id, :responsibility_id, :price, :prefecture_id, presence: true 
  validates :condition_id, :shipment_id, :responsibility_id, :prefecture_id, numericality: { only_integer: true, greater_than: 1, less_than: 47}
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end