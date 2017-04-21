ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  ActiveAdmin.register User do
    index do
      column :id
      column :email
      column :last_sign_in_at
    end
  end

  filter :id
  filter :email
  filter :last_sign_in_at

permit_params :id, :email



end
