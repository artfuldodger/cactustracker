class Plant < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [500, 500]
  end

  validates :nickname, presence: true
end
