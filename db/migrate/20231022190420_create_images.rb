class CreateImages < ActiveRecord::Migration[7.0]
  class Plant < ApplicationRecord
    self.table_name = :plants

    has_many_attached :images do |attachable|
      attachable.variant :thumb, resize_to_limit: [100, 100]
      attachable.variant :medium, resize_to_limit: [500, 500]
    end
  end

  class Image < ApplicationRecord
    self.table_name = :images

    belongs_to :imageable, polymorphic: true

    has_one_attached :image do |attachable|
      attachable.variant :thumb, resize_to_limit: [100, 100]
      attachable.variant :medium, resize_to_limit: [500, 500]
    end
  end

  def up
    create_table :images do |t|
      t.references :imageable, polymorphic: true, null: false
      t.text :caption

      t.timestamps
    end

    Plant.all.each do |plant|
      plant.images.each do |og_image|
        Image.create!(imageable: plant, image: og_image.blob)
      end
    end
  end

  def down
    # not implemented
  end
end
