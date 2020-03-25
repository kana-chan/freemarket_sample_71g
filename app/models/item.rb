class Item < ApplicationRecord
  validates :name, :explaination, :conditon, :date, :responsibility, :price, :prefecture_id, presence: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
