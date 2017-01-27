ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: 'Recent Updates' do
    table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
      column ("Item") { |v| v.item }
      column ("Type") { |v| v.item_type.underscore.humanize }
      column ("Modified at") { |v| v.created_at.to_s :long }
      column ("Admin") { |v| link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] }
    end
  end
end
