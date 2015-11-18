ActiveAdmin.register Member do
  permit_params :identifier, :name, :active

  config.sort_order = 'name_asc'

  form do |f|
    f.inputs do
      f.input :identifier
      f.input :name
      f.input :active
    end

    f.actions
  end

  index do
    selectable_column
    column :identifier, sortable: :identifier
    column :name, sortable: :name
    column :active, sortable: :active
    actions
  end

  action_item only: :show do
    link_to 'New Member', new_admin_member_path, method: :get
  end
end
