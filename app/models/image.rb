class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [500, 500]
  end

  def deletable_by?(user)
    return false if user.nil?

    imageable.user == user
  end
end
