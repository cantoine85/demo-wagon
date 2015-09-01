# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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


experiences = [
  { title: "Exposition Universelle Milan 2015",
    description: "147 pays pour échanger sur le thème crucial : « Nourrir la planète et l'Energie pour la vie ».",
    startdate: Time.zone.parse('2015-05-15'),
    enddate: Time.zone.parse('2015-10-31'),
    address: "Milan"
  },
  { title: "Agua de PINA BAUSCH",
    description: "",
    startdate: Time.zone.parse('2015-05-15'),
    enddate: Time.zone.parse('2015-10-31'),
    address: "Milan"
  }
]

# Create experiences
experiences.each do |experience|
  e = Experience.create(experience)
end

# Add categories to experiences
Experience.find(1).categories << Category.new(name: "sport")
Experience.find(1).categories << Category.new(name: "voyage")

Experience.find(2).categories << Category.new(name: "sport")









