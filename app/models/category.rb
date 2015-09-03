class Category < ActiveRecord::Base

  # has_and_belongs_to_many :experiences
  has_many :categories_experiences
  has_many :experiences, through: :categories_experiences

  validates :name, uniqueness: true, presence: true
end
