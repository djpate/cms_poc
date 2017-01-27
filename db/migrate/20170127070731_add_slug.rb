class AddSlug < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :slug, :string, unique: true
  end
end