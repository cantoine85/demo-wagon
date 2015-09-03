class Experience < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # Associations
  belongs_to :actor, class_name: "User"
  belongs_to :inspirer, class_name: "User"
  belongs_to :adventure

  # paperclip picture
  # has_attached_file :picture,
  #   styles: { medium: "500x500>", thumb: "100x100>" }

  # validates_attachment_content_type :picture,
  #   content_type: /\Aimage\/.*\z/
end

