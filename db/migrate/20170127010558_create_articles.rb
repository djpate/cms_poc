class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    
    create_table :articles do |t|
      t.boolean :published, default: false
      t.string :title
      t.string :description
      t.text :content
      t.integer :creator
      t.integer :last_editor
      t.timestamp :published_date
      t.timestamps
    end

    add_index :articles, :creator
    add_index :articles, :last_editor

  end
end
