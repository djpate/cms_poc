ActiveAdmin.register Widget do
  permit_params :name, :html_content, :widget_category_id, :thumb

  form do |f|
    f.inputs "Article Details" do
      f.input :name
      f.input :html_content
      f.input :widget_category
      f.input :thumb, as: :file, :hint => f.object.thumb.present? ? image_tag(f.object.thumb.url(:small)) : ""
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :widget_category
    column :thumb do |resource|
      image_tag(resource.thumb.url(:small))
    end
    actions
  end

end
