class CategoriesExperience < ActiveRecord::Base

  # has_and_belongs_to_many :experiences
  belongs_to :experience
  belongs_to :category

  # validates :category_id, presence: true
  # validates :experience_id, presence: true
end
