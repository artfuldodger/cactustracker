module Policies
  class ImageEditing
    def initialize(user, image)
      self.user = user
      self.image = image
    end

    def allowed?
      [user, image].all?(&:present?) && user == image.imageable.user
    end

    private

    attr_accessor :user, :image
  end
end
