class Plant < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  has_many :images, as: :imageable

  validates :nickname, presence: true
end
