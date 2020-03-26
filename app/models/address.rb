class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :prefectures, :city, :street, :building_name ,presence: true
end
