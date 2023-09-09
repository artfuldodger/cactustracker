class Plant < ApplicationRecord
  belongs_to :user
  has_many :measurements

  validates :nickname, presence: true
end
