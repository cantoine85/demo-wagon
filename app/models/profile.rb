class Profile < ActiveRecord::Base

  # Associations
  belongs_to :user # A profile belongs to one user

  # Validations
  validates :user, presence:true
  validates :first_name, presence:true

end
