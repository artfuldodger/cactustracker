class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  before_create :set_slug

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :plants

  def self.confirmed
    where.not(confirmed_at: nil)
  end

  def to_param
    slug
  end

  private

  def set_slug
    self.slug ||= name.parameterize
  end
end
