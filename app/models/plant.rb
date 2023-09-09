class Plant < ApplicationRecord
  belongs_to :user

  validates :nickname, presence: true
end
