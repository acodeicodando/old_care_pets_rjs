class Pet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  enum pet_type: [ :dog, :cat, :others ]

  validates :name, :date_of_birth, :pet_type, presence: true
end
