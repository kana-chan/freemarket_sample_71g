class Item < ApplicationRecord
  validates :name, :explaination, :condition_id, :shipment_id, :responsibility_id, :price, :prefecture_id, presence: true 
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  #validates_associated :images
  #validates :images, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :responsibility
  belongs_to_active_hash :shipment
end