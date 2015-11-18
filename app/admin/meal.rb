ActiveAdmin.register Meal do
  permit_params :member_id, :dinner_indicator

  form do |f|
    f.inputs do
      f.input :member_id, as: :select, collection: 
        Member.select(:id, :name).order(:name)
      f.input :dinner_indicator
    end

    f.actions
  end

  index do
    column :member_id, sortable: :member_id do |m|
      Member.find(m.member_id).name
    end
    column :dinner_indicator, sortable: :dinner_indicator
    actions
  end

  show do
    attributes_table do
      row('Member') { |m| Member.find(m.member_id).name }
      row :dinner_indicator
      row :created_at
      row :updated_at
    end
  end

  action_item only: :show do
    link_to 'New Meal', new_admin_meal_path, method: :get
  end
end
