class Address < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :condition
  # belongs_to_active_hash :responsibility
  # belongs_to_active_hash :shipment
  belongs_to :user, optional: true
  validates :zip, :prefecture, :city, :street, :building_name ,presence: true
end
