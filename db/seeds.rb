# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

taco = Student.new
taco.first_name = "Taco"
taco.sms_phone_number = "4158675309"
taco.email = "taco@generalasssemb.ly"
taco.save

taco = Student.new
taco.first_name = "Nacho"
taco.sms_phone_number = "4158675310"
taco.email = "nacho@generalasssemb.ly"
taco.save

taco = Student.new
taco.first_name = "Han"
taco.last_name = "Solo"
taco.sms_phone_number = "4158675311"
taco.email = "han@generalasssemb.ly"
taco.save