ActiveAdmin.register User do

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :name, :picture
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    selectable_column
    column :id
    column :email
    column :name
    column :created_at
    column :admin
    actions
  end

end
