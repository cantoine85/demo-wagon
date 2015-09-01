# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all

# Seed for categories
names = ["sport", "voyage", "exposition", "spectacle", "balade", "cinéma", "lecture"]

names.each do |name|
  cat = Category.new(name: name)
  cat.save
end


users = []
{ email: "nathy@gmail.com",
  password: "blabla2045"
},
{ email: "anastasia@hotmail.com",
  password: "blabrty209745"
},
{ email: "stefiam@gmail.com",
  password: "blabrtfjk745":
},
{ email: "fjsqfkn@hotmail.com",
  password: "blaEUII4dj"
},
{ email: "claireatoutbon@hotmail.com",
  password: "bfmlffkly209745"
}

users.each do |user|
  User.create(user)
end

experiences = [
  { title: "Découvrir le monde à l'Exposition Universelle de Milan 2015",
    description: "147 pays pour échanger sur le thème crucial : « Nourrir la planète et l'Energie pour la vie ».",
    startdate: Time.zone.parse('2015-05-15'),
    enddate: Time.zone.parse('2015-10-31'),
    address: "Milan",
    user_id: 1
  },
  { title: "Vibrer devant Agua de PINA BAUSCH",
    description: "Fièvre brésilienne : L’insouciance, la couleur, les rythmes pimentent le flot ininterrompu de cette pièce de Pina Bausch sous influence voyageuse.",
    startdate: Time.zone.parse('2016-05-07'),
    enddate: Time.zone.parse('2015-05-15'),
    address: "Théâtre de la Ville 75001 Paris",
    user_id: 2
  },
  { title: "Se dépasser au Marathon de Paris",
    description: "l’un des marathons les plus importants marathons du monde, tant par l’importance du peloton que par les performances réalisées.",
    startdate: Time.zone.parse('2016-04-03 09:00:00'),
    enddate: Time.zone.parse('2016-04-03 19.00.00'),
    address: "Paris",
    user_id: 3
  },
  { title: "danser dans les guinguettes des bords de Marne",
    description: "le patrimoine culturel et naturel des bords de Marne à travers les célèbres guinguettes, une nature abondante et une architecture éclectique.",
    address: "Saint-Maur-des-Fossés",
    user_id: 4
  },
  { title: "Vivre la fin du monde devant Mad Max: Fury Road",
    description: "L'univers est fabuleux, crasseux, poussiéreux, punk, malsain, glauque, les corps sont abimés, dégénérés, malades, la terre est acide...",
    address: "Cinéma des Cinéastes 7, av. de Clichy 75017 Paris",
    user_id: 5
  },
]

# Create experiences
experiences.each do |experience|
    e = Experience.create(experience)
end

# Add categories to experiences
Experience.find(1).categories << Category.new(name: "exposition")
Experience.find(1).categories << Category.new(name: "voyage")
Experience.find(2).categories << Category.new(name: "sport")
Experience.find(3).categories << Category.new(name: "spectacle")

# Add user_id to experience













