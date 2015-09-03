class Adventure < ActiveRecord::Base
  belongs_to :user
  has_many :experiences

  validates :category, presence: true, uniqueness: true
  validates :title, presence: true
  validates :user, presence: true

  CATEGORIES = ['voyage', 'balade', 'art', 'théâtre', 'opéra', 'musique', 'sport', 'évasion', 'spectacle', 'photographie']

end
