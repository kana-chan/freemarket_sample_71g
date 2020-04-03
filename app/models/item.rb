class Item < ApplicationRecord
  validates :name, :explaination, :condition_id, :shipment_id, :responsibility_id, :price, :prefecture_id, presence: true 
  belongs_to :user,class_name: 'User', :foreign_key => 'seller_id'
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  #validates_associated :images
  #validates :images, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :responsibility
  belongs_to_active_hash :shipment
  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true

end
