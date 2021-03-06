ActiveAdmin.register Experience do

  permit_params :actor, :inspirer, :adventure, :start_date, :end_date,
   :rating, :address, :private_note, :public_review, :status

  index do
    selectable_column
    column :id
    column :category
    column :adventure
    column :actor
    column :status
    column :inspirer
    column :created_at
    column :admin
    actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
