class Adventure < ActiveRecord::Base
  belongs_to :user

  validates :category, presence: true, uniqueness: true
  validates :title, presence: true
  validates :user, presence: true

end
