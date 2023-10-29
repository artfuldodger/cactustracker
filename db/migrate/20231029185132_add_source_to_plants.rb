class AddSourceToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :source, :string
  end
end
