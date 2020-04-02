class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
         validates :nickname, :email, presence: true, uniqueness: true
         validates :first_name, :last_name, :first_furigana, :last_furigana, :password, :phone_number, :birthday, :gender, :image, presence: true
         validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_furigana, :last_furigana, format: { with: /\A[ぁ-んー－]+\z/ }
         validates :phone_number, format: { with: /\A\d{10,11}\z/ }
         has_one :address
         has_many :items
         
         
        #  extend ActiveHash::Associations::ActiveRecordExtensions
        #  belongs_to_active_hash :prefecture
end
