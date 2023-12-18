module Policies
  class PlantEditing
    def initialize(user, plant)
      self.user = user
      self.plant = plant
    end

    def allowed?
      [user, plant].all?(&:present?) && user == plant.user
    end

    private

    attr_accessor :user, :plant
  end
end
