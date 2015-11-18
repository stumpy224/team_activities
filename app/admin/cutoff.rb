ActiveAdmin.register Cutoff do
  permit_params :cutoff_at

  form do |f|
    f.inputs do
      f.input :cutoff_at
    end

    f.actions
  end

  index do
    selectable_column
    column :cutoff_at, sortable: :cutoff_at
    actions
  end

  show do
    attributes_table do
      row :cutoff_at
      row :created_at
      row :updated_at
    end
  end

  action_item only: :show do
    link_to 'New Cutoff', new_admin_cutoff_path, method: :get
  end
end
