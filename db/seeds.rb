# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_list = [
  [ "Food", "You are hungry or have food to share?" ],
  [ "Medicine", "Don't throw away your medicine, someone might need them" ],
  [ "Money", "Need money to build your orphanage, temple or church?" ],
  [ "Machinery", "Have old stuff that still can be used by other people?" ]
]

category_list.each do |name, desc|
	Category.create(name: name, desc: desc)
end
