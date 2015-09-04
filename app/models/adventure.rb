class Adventure < ActiveRecord::Base
  belongs_to :user
  has_many :experiences

  validates :category, presence: true, uniqueness: true
  validates :title, presence: true
  validates :user, presence: true

  CATEGORIES = ['voyage', 'balade', 'fun', 'la vie en rose', 'plaisir', 'cinéma', 'art', 'théâtre', 'opéra', 'musique', 'sport', 'évasion', 'spectacle', 'concert', 'photographie', 'sensations']

end
