ActiveAdmin.register Customer do
  # Active storage tables cause an error in the filter section due to
  # polymorphic associations.
  remove_filter :avatar_attachment, :avatar_blob

  # Allow active admin to use these params when creating and updating records.
  permit_params :full_name, :phone_number, :email_address, :notes, :avatar

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      if f.customer.avatar.attached?
        f.input :avatar, as: :file, allow_destroy: true, :hint => image_tag(f.customer.avatar)
      else
        f.input :avatar, as: :file
      end
      f.actions
    end
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :avatar do |image|
        if image.avatar.attached?
          image_tag url_for(image.avatar)
        end
      end
    end
  end
end
