class Plant < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  validates :nickname, presence: true
end
