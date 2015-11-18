ActiveAdmin.register Vote do
  permit_params :member_id, :nomination_id, :points

  form do |f|
    f.inputs do
      f.input :member_id, as: :select, collection: 
        Member.select(:id, :name).order(:name)

      f.input :nomination_id, label: 'Restaurant', as: :select,
        collection: Nomination.all.map{|n| [Restaurant.find(n.restaurant_id).name, n.id]}
      
      f.input :points
    end

    f.actions
  end

  index do
    selectable_column
    column :member_id, sortable: :member_id do |m|
      Member.find(m.member_id).name
    end
    column :nomination_id, label: 'Restaurant', sortable: :nomination_id do |n|
      Restaurant.find(n.nomination_id).name
    end
    column :points, sortable: :points
    column :created_at, sortable: :created_at
    column :updated_at, sortable: :updated_at
    actions
  end

  show do
    attributes_table do
      row('Member') { |m| Member.find(m.member_id).name }
      row('Restaurant') { |n| Restaurant.find(n.nomination_id).name }
      row :points
      row :created_at
      row :updated_at
    end
  end

  action_item only: :show do
    link_to 'New Vote', new_admin_vote_path, method: :get
  end
end
