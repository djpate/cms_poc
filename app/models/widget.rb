class Widget < ApplicationRecord
  has_attached_file :thumb, styles: { small: "300" }
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\z/

  belongs_to :widget_category
end
