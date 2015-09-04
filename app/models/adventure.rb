class Adventure < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :experiences

  # Validations
  validates :category, presence: true
  validates :title, presence: true
  validates :user, presence: true

  # Create global varibale
  CATEGORIES = ['voyage', 'balade', 'art', 'théâtre', 'opéra', 'musique', 'sport', 'évasion', 'spectacle', 'photographie']

  # Add paperclip picture
  has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

    # Validation for picture
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end
