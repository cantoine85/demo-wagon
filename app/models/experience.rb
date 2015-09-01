class Experience < ActiveRecord::Base
  belongs_to :user


  # Direct relationships between experiences
  # An experience has many direct child experiences
  has_many :direct_child_experiences, class_name: "Experience",
                                foreign_key: "direct_parent_experience_id"

  # An experience has one direct parent
  belongs_to :direct_parent_experience, class_name: "Experience"

  # Deep relationships
  # An original experience (first creation) has many deep child experiences
  has_many :deep_child_experiences, class_name: "Experience",
                                  foreign_key: "author_experience_id"
  # An experience has one original parent
  belongs_to :author_experience, class_name: "Experience"

end
