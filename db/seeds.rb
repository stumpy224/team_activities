# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create(identifier: 'OPR1035', name: 'Axel Ortiz', active: true)
Member.create(identifier: 'OPR1012', name: 'Brandon Corbin', active: true)
Member.create(identifier: 'OPR0474', name: 'Brittany Gonzalez', active: true)
Member.create(identifier: 'OPR1005', name: 'Chris Fleenor', active: true)
Member.create(identifier: 'OPR9987', name: 'Corinna Cohn', active: true)
Member.create(identifier: 'OPR9587', name: 'George Yang', active: true)
Member.create(identifier: 'OPR9089', name: 'Greg Davidson', active: true)
Member.create(identifier: 'OPR8433', name: 'Gunjan Upadhayay', active: true)
Member.create(identifier: 'OPR6477', name: 'Jarvis Ka', active: true)
Member.create(identifier: 'OPR4567', name: 'Jay Nightenhelser', active: true)
Member.create(identifier: 'OPR4523', name: 'Jeremiah Stump', active: true)
Member.create(identifier: 'OPR8481', name: 'Jo Lee Hayes', active: true)
Member.create(identifier: 'OPR9890', name: 'Jonathon Korty', active: true)
Member.create(identifier: 'OPR5459', name: 'Leah Wine', active: true)
Member.create(identifier: 'OPR0196', name: 'Mark Hamilton', active: true)
Member.create(identifier: 'OPR6728', name: 'Matt Brown', active: true)
Member.create(identifier: 'OPR6306', name: 'Matt White', active: true)
Member.create(identifier: 'OPR7552', name: 'Nathan Nontell', active: true)
Member.create(identifier: 'OPR1016', name: 'Nick Celestin', active: true)
Member.create(identifier: 'OPR9269', name: 'Randy Jackson', active: true)
Member.create(identifier: 'OPR1032', name: 'Subbaiah Pemmaiah', active: true)
Member.create(identifier: 'OPR1008', name: 'Tapan Virvani', active: true)
Member.create(identifier: 'OPR1031', name: 'Tom Schweizer', active: true)
Member.create(identifier: 'OPRTEK1', name: 'Upender Rachakonda', active: true)

Restaurant.create(name: 'Fogo De Chao', url: 'http://www.fogodechao.com/menu')
Restaurant.create(name: 'Palomino', url: 'http://www.palomino.com/menu.php?c=indianapolis')
Restaurant.create(name: 'Harry & Izzy\'s', url: 'http://www.harryandizzys.com/menu/')
Restaurant.create(name: 'St. Elmo', url: 'http://www.stelmos.com/menu/dinner-dessert/')
Restaurant.create(name: 'Capital Grille', url: 'http://www.thecapitalgrille.com/menu-listing/lunch')
Restaurant.create(name: 'Ruth\'s Chris', url: 'http://www.ruthschris.com/menu')
Restaurant.create(name: 'Morton\'s Steakhouse', url: 'http://www.mortons.com/index.php')
Restaurant.create(name: 'Georgia Reese\'s', url: 'http://georgiareeses.com/downtown/menu/')
Restaurant.create(name: 'Iron Skillet', url: 'http://www.ironskillet.net/menu.htm')

Restaurant.all.each do |r|
  Nomination.create(restaurant_id: r.id)
end

Cutoff.create(cutoff_at: '2015-11-18T14:00:00')
