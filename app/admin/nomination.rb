ActiveAdmin.register Nomination do
  permit_params :restaurant_id

  config.sort_order = 'name_asc'

  form do |f|
    f.inputs do
      f.input :restaurant_id, as: :select, collection: 
        Restaurant.select(:id, :name).order(:name)
    end

    f.actions
  end

  index do
    selectable_column
    column :restaurant_id, sortable: :restaurant_id do |r|
      Restaurant.find(r.restaurant_id).name
    end
    actions
  end

  show do
    attributes_table do
      row('Restaurant') { |r| Restaurant.find(r.restaurant_id).name }
      row :created_at
      row :updated_at
    end
  end

  action_item only: :show do
    link_to 'New Nomination', new_admin_nomination_path, method: :get
  end
end
