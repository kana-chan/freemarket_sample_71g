class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates : zip, :address ,presence: true
end
