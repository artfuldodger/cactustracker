class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :plants
end
