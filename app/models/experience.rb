class Experience < ActiveRecord::Base

  # Associations
  belongs_to :actor, class_name: "User"
  belongs_to :inspirer, class_name: "User"
  belongs_to :adventure

  # Validations
  validates :adventure, presence: true
  validates :inspirer, presence: true

  # Add paperclip picture
  has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  # Add Geocoder
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # Get title from adventure
  def title
    adventure.title
  end

  # Get category from adventure
  def category
    adventure.category
  end
end

