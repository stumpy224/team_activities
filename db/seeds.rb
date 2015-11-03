# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create(identifier: 'OPR4523', name: 'Jeremiah Stump', active: true)
Member.create(identifier: 'OPR7552', name: 'Nathan Nontell', active: true)
Member.create(identifier: 'OPR6306', name: 'Matt White', active: true)
Member.create(identifier: 'OPR0196', name: 'Mark Hamilton', active: true)
Member.create(identifier: 'OPR9089', name: 'Greg Davidson', active: true)
Member.create(identifier: 'OPR8481', name: 'Jo Lee Hayes', active: true)
Member.create(identifier: 'OPR9269', name: 'Randy Jackson', active: true)
Member.create(identifier: 'OPR6477', name: 'Jarvis Ka', active: true)
Member.create(identifier: 'OPR4567', name: 'Jay Nightenhelser', active: true)
Member.create(identifier: 'OPRTEK1', name: 'Upender Rachakonda', active: true)
Member.create(identifier: 'OPR1031', name: 'Tom Schweizer', active: true)
Member.create(identifier: 'OPR5459', name: 'Leah Wine', active: true)
Member.create(identifier: 'OPR9587', name: 'George Yang', active: true)
Member.create(identifier: 'OPR6728', name: 'Matt Brown', active: true)
Member.create(identifier: 'OPR0474', name: 'Brittany Gonzalez', active: true)

Restaurant.create(name: 'Fogo De Chao', url: 'http://www.fogodechao.com/menu/meats/picanha/')
Restaurant.create(name: 'Palomino', url: 'http://www.palomino.com/menu.php?c=indianapolis')
Restaurant.create(name: 'Harry & Izzy\'s', url: 'http://www.harryandizzys.com/menu/')
Restaurant.create(name: 'St. Elmo\'s', url: 'http://www.stelmos.com/menu/dinner-dessert/')
Restaurant.create(name: 'Prime 47', url: 'http://indianapolis.prime47.com/menu/')
Restaurant.create(name: 'Capital Grille', url: 'https://www.thecapitalgrille.com/pages/menu/dinner.aspx?id=8032')
Restaurant.create(name: 'Ruth\'s Chris', url: 'http://www.ruthschris.com/menu')
Restaurant.create(name: 'Morton\'s Steakhouse', url: 'http://www.mortons.com/index.php')

Restaurant.all.each do |r|
  Nomination.create(restaurant_id: r.id)
end
