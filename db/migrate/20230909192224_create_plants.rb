class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :variety
      t.text :description

      t.timestamps
    end
  end
end
