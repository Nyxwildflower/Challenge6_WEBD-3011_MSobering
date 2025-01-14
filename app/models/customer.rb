class Customer < ApplicationRecord
  has_one_attached :avatar

  validates :full_name, :phone_number, presence: true
  validates :full_name, :email_address, length: { maximum: 75 }

  # Permits active_admin to filter and search with these attributes.
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email_address", "full_name", "id", "id_value", "notes", "phone_number", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["avatar_attachment", "avatar_blob"]
  end
end
