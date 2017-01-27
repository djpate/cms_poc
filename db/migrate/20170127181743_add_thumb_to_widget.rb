class AddThumbToWidget < ActiveRecord::Migration[5.0]
  
  def up
    add_attachment :widgets, :thumb
  end

  def down
    remove_attachment :widgets, :thumb
  end
  
end
