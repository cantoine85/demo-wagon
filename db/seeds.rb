# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Experience.destroy_all

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

adventures = [
  { title: "Découvrir le monde à l'Exposition Universelle de Milan 2015",
    category: "voyage",
    description: "147 pays pour échanger sur le thème crucial : « Nourrir la planète et l'Energie pour la vie ».",
    start_date: Time.zone.parse('2015-05-15'),
    end_date: Time.zone.parse('2015-10-31'),
    address: "Milan",
    user_id: User.last.id
  },
  { title: "Vibrer devant Agua de PINA BAUSCH",
    category: "spectacle",
    description: "Fièvre brésilienne : L’insouciance, la couleur, les rythmes pimentent le flot ininterrompu de cette pièce de Pina Bausch sous influence voyageuse.",
    start_date: Time.zone.parse('2016-05-07'),
    end_date: Time.zone.parse('2015-05-15'),
    address: "Théâtre de la Ville 75001 Paris",
    user_id: User.last.id - 1
  },
  { title: "Se dépasser au Marathon de Paris",
    category: "sport",
    description: "l’un des marathons les plus importants marathons du monde, tant par l’importance du peloton que par les performances réalisées.",
    start_date: Time.zone.parse('2016-04-03 09:00:00'),
    end_date: Time.zone.parse('2016-04-03 19.00.00'),
    address: "Paris",
    user_id: User.last.id - 2
  },
  { title: "danser dans les guinguettes des bords de Marne",
    category: "la vie en rose",
    description: "le patrimoine culturel et naturel des bords de Marne à travers les célèbres guinguettes, une nature abondante et une architecture éclectique.",
    address: "Saint-Maur-des-Fossés",
    user_id: User.last.id - 3
  },
  { title: "Vivre la fin du monde devant Mad Max: Fury Road",
    category: "cinéma",
    description: "L'univers est fabuleux, crasseux, poussiéreux, punk, malsain, glauque, les corps sont abimés, dégénérés, malades, la terre est acide...",
    address: "Cinéma des Cinéastes 7, av. de Clichy 75017 Paris",
    user_id: User.last.id - 4
  },
  { title: "Faire un saut à l'élastique depuis le pont du Gard",
    category: "sensation",
    description: "c'est chaud !",
    address: "Pont du Gard",
    user_id: User.last.id - 4
  },
  { title: "Sourire à 10 personnes dans le métro",
    category: "la vie en rose",
    description: "aller chercher bonheur",
    address: "Paris",
    user_id: User.last.id
  },
  { title: "Revoir le malade imaginaire",
    category: "la vie en rose",
    description: "vive la culture classique",
    address: "Comédie Française, 1 Place Colette, 75001 Paris",
    user_id: User.last.id - 3
  },
  { title: "Apprendre à faire des makis",
    category: "cuisine",
    description: "attention, super classe, bien roulés avec des jolies couleurs => acheter un appareil à makis",
    address: "Atelier des chefs",
    user_id: User.last.id - 3
  },
  { title: "essayer un whisky japonais de 20 ans d'âge dans un bar secret",
    category: "plaisir",
    description: "gros kiff",
    address: "le Moonshiner 5 rue Sedaine 75011 Paris",
    user_id: User.last.id - 1
  },
  { title: "faire du deltaplane à Rio",
    category: "sensation",
    description: "partir d'une colline et arriver sur la plage => boire une coco verde",
    address: "Rio",
    user_id: User.last.id - 2
  },
]


# Create adventure
adventures.each_with_index do |adventure, index|
  e = Adventure.new(adventure)

  if e.save
    e.save
    exp = Experience.new(adventure: e, inspirer_id: e.user_id)
    if index.odd?
      exp.status = "done"
    else
      exp.status = "to_do"
    end
    exp.save
    puts "#{exp.id}.#{exp.title} status : #{exp.status}"
  else
    puts 'adventure not valid'
  end
end













