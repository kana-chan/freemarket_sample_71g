class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
         validates :nickname, :email, presence: true, uniqueness: true
         validates :first_name, :last_name, :first_furigana, :last_furigana, :password, :phone_number, :birthday, :gender, presence: true
         validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_furigana, :last_furigana, format: { with: /\A[ぁ-んー－]+\z/ }
         validates :phone_number, format: { with: /\A\d{10,11}\z/ }
         has_one :address
         has_many :items,dependent: :destroy
         has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
         has_many :selling_items, ->{ where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
         has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
        #  has_many :bought_products, class_name: "Product", foreign_key: "buyer_id"
        #  has_many :sold_products, class_name: "Product", foreign_key: "seller_id", -> { where("buyer_id is not NULL") }
        #  extend ActiveHash::Associations::ActiveRecordExtensions
        #  belongs_to_active_hash :prefecture
end
