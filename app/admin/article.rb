ActiveAdmin.register Article do

  permit_params :title, :description, :content

  member_action :publish, method: :put do
    resource.publish!
    redirect_to resource_path, notice: "Published!"
  end

  member_action :unpublish, method: :put do
    resource.unpublish!
    redirect_to resource_path, notice: "Unpublished!"
  end

  action_item :view, only: :show do
    link_to 'View on site', article_path(resource) if resource.published?
  end

  action_item :view, only: :show do
    link_to 'Publish', publish_admin_article_path(resource), :method => :put unless resource.published?
  end

  action_item :view, only: :show do
    link_to 'Unpublish', unpublish_admin_article_path(resource), :method => :put if resource.published?
  end

  form do |f|
    f.inputs "Article Details" do
      f.input :title
      f.input :description
      f.input :content
      div id: "contentarea", class: "base" do
        raw f.resource.content
      end
    end
    f.actions
  end
end
