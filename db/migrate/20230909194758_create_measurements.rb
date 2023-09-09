class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.references :plant, null: false, foreign_key: true
      t.date :date, null: false
      t.float :size, null: false
      t.string :unit, null: false

      t.timestamps
    end
  end
end
