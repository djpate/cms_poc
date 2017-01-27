ActiveAdmin.register Article do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :title, :description, :content, :slug

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

  member_action :history do
    @article = Article.friendly.find(params[:id])
    @versions = PaperTrail::Version.where(item_type: 'Article', item_id: @article.id)
    render "layouts/history"
  end

  sidebar :versions, :partial => "layouts/version", :only => :show

  form do |f|
    f.inputs "Article Details" do
      f.input :title
      f.input :slug
      f.input :description
      f.input :content
      div id: "contentarea", class: "base base_admin" do
        raw f.resource.content
      end
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :published
    column :created_at
    column :updated_at
    actions
  end

end
