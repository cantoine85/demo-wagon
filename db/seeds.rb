# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Experience.destroy_all
User.destroy_all
Category.destroy_all

# Seed for categories
names = [ "cinéma", "balade", "sport", "art", "voyage" ]


names.each do |name|
  cat = Category.new(name: name)
  cat.save
end


users = [
  { email: "nathy@gmail.com",
    password: "blabla2045"
  },
  { email: "anastasia@hotmail.com",
    password: "blabrty209745"
  },
  { email: "stefiam@gmail.com",
    password: "blabrtfjk745"
  },
  { email: "fjsqfkn@hotmail.com",
    password: "blaEUII4dj"
  },
  { email: "claireatoutbon@hotmail.com",
    password: "bfmlffkly209745"
  }
]

users.each do |user|
  User.create(user)
end

experiences = [
  { title: "Découvrir le monde à l'Exposition Universelle de Milan 2015",
    description: "147 pays pour échanger sur le thème crucial : « Nourrir la planète et l'Energie pour la vie ».",
    startdate: Time.zone.parse('2015-05-15'),
    enddate: Time.zone.parse('2015-10-31'),
    address: "Milan",
    user_id: User.last.id
  },
  { title: "Vibrer devant Agua de PINA BAUSCH",
    description: "Fièvre brésilienne : L’insouciance, la couleur, les rythmes pimentent le flot ininterrompu de cette pièce de Pina Bausch sous influence voyageuse.",
    startdate: Time.zone.parse('2016-05-07'),
    enddate: Time.zone.parse('2015-05-15'),
    address: "Théâtre de la Ville 75001 Paris",
    user_id: User.last.id - 1
  },
  { title: "Se dépasser au Marathon de Paris",
    description: "l’un des marathons les plus importants marathons du monde, tant par l’importance du peloton que par les performances réalisées.",
    startdate: Time.zone.parse('2016-04-03 09:00:00'),
    enddate: Time.zone.parse('2016-04-03 19.00.00'),
    address: "Paris",
    user_id: User.last.id - 2
  },
  { title: "danser dans les guinguettes des bords de Marne",
    description: "le patrimoine culturel et naturel des bords de Marne à travers les célèbres guinguettes, une nature abondante et une architecture éclectique.",
    address: "Saint-Maur-des-Fossés",
    user_id: User.last.id - 3
  },
  { title: "Vivre la fin du monde devant Mad Max: Fury Road",
    description: "L'univers est fabuleux, crasseux, poussiéreux, punk, malsain, glauque, les corps sont abimés, dégénérés, malades, la terre est acide...",
    address: "Cinéma des Cinéastes 7, av. de Clichy 75017 Paris",
    user_id: User.last.id - 4
  },
]

experience_categories = [ "cinéma", "balade", "sport", "art", "voyage" ].reverse

# Create experiences
experiences.each_with_index do |experience, index|
  e = Experience.new(experience)
  #e.categories << Category.find_by_name(experience_categories[index])
  if e.save
    puts "Saveeeeeeed !!!!!"
  else
    puts "Fuckeeeeed !!!"
  end
end

# Add categories to experiences
# Experience.last.categories << Category.find_by(name: "cinéma")
# Experience.last(2).first.categories << Category.find_by(name: "balade")
# Experience.last(3).first.categories << Category.find_by(name: "sport")
# Experience.last(4).first.categories << Category.find_by(name: "art")
# Experience.first.categories << Category.find_by(name: "voyage")

# Add user_id to experience













