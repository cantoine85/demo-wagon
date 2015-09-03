class Experience < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user

  # Direct relationships between experiences
  # An experience has many direct child experiences
  has_many :direct_child_experiences, class_name: "Experience", foreign_key: "direct_parent_experience_id"

  # An experience has one direct parent
  belongs_to :direct_parent_experience, class_name: "Experience"

  # Deep relationships
  # An original experience (first creation) has many deep child experiences
  has_many :deep_child_experiences, class_name: "Experience", foreign_key: "author_experience_id"
  # An experience has one original parent
  belongs_to :author_experience, class_name: "Experience"

  # has_and_belongs_to_many :categories
  has_many :categories_experiences
  has_many :categories, through: :categories_experiences

  validates :title, presence: true
  # validates :user_id, uniqueness: true, presence: true

  # paperclip picture
  has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end

