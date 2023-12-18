class AddSlugToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :slug, :string

    User.all.each { |u| u.send(:set_slug) && u.save! }

    add_index :users, :slug, unique: true
    change_column_null :users, :slug, false
  end
end
