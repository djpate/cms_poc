class WidgetCategories < ActiveRecord::Migration[5.0]
  def change
    
    create_table :widget_categories do |t|
      t.string :name
      t.integer :category_id
      t.timestamps
    end

    add_column :widgets, :widget_category_id, :integer

  end
end
