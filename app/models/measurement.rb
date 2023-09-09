class Measurement < ApplicationRecord
  belongs_to :plant

  validates :date, :size, :unit, presence: true
end
