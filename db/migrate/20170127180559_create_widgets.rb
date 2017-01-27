class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :html_content
      t.timestamps
    end
  end
end
