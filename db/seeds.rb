# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## sample users for fistOfFive
# turing = User.create(first_name: 'Alan', last_name: 'Turing', email: 'alan@alan.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4154448888')

# nacho = User.create(first_name: 'Ignacio', last_name: 'Iglesias', email: 'nacho@nacho.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4158888888')


# uxdi = Course.create(title: 'UXDI', desc: 'User experience design immersive', schedule: 'SF-July')


## for associating nicknames in console
# grace = User.find_by_email('grace@grace.com')
# nacho = User.find_by_email('nacho@nacho.com') 
# turing = User.find_by_email('alan@alan.com')

# wdi = Course.find_by_title('WDI')
# uxdi = Course.find_by_title('UXDI')

# four = Poll.find(4)
# ten = Poll.find(10)


## making associations etc
# nacho.courses << uxdi
# turing.courses << uxdi 

# Poll.create(topic: 'AJAX', user_id: 6, course_id: 1, is_open: false)
# grace.polls << Poll.find_by_title('AJAX')
# Poll.create(topic: 'Bootstrap', user_id: 29, course_id: 1, is_open: false)
# Poll.create(topic: 'User Experience', user_id: 28, course_id: 2, is_open: false)
# Poll.create(topic: 'Design concepts', user_id: 29, course_id: 2, is_open: false)

cool = Reply.create(poll_id: 4, user_id: 28, response: "4 I'm cool with it", from_number: 4154448888)
cool.update(poll_id: 16)