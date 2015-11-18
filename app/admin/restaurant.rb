ActiveAdmin.register Restaurant do
  permit_params :name, :url

  config.sort_order = 'name_asc'

  form do |f|
    f.inputs do
      f.input :name
      f.input :url
    end

    f.actions
  end

  index do
    selectable_column
    column :name, sortable: :name
    column :url, sortable: :url
    actions
  end

  action_item only: :show do
    link_to 'New Restaurant', new_admin_restaurant_path, method: :get
  end
end
