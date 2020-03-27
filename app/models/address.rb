class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :prefectures, :city, :street, :first_name_ad, :last_name_ad, :first_furigana_ad, :last_furigana_ad ,presence: true
  validates :first_name_ad, :last_name_ad, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_furigana_ad, :last_furigana_ad, format: { with: /\A[ぁ-んー－]+\z/ }
end
