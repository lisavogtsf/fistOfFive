# #sample users for fistOfFive
# turing = User.create(first_name: 'Alan', last_name: 'Turing', email: 'alan@alan.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4154448888')

# nacho = User.create(first_name: 'Ignacio', last_name: 'Iglesias', email: 'nacho@nacho.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4158888888')
# grace = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'grace@grace.com', password: '1234', password_confirmation: '1234', sms_phone_number: '3335554433')


# uxdi = Course.create(title: 'UXDI', desc: 'User experience design immersive', schedule: 'SFJuly')
# wdi = Course.create(title: "WDI", desc: 'Web Development Immersive', schedule: 'SFAugust')

# for associating nicknames in console
# grace = User.find_by_email('grace@grace.com')
# nacho = User.find_by_email('nacho@nacho.com') 
# turing = User.find_by_email('alan@alan.com')

# wdi = Course.find_by_title('WDI')
# uxdi = Course.find_by_title('UXDI')


# making associations etc
# nacho.courses << uxdi
# turing.courses << uxdi 
# turing.courses << wdi
# grace.courses << wdi
# grace.courses << uxdi

# ux = Poll.create(topic: 'User Experience', user_id: 1, course_id: 2, is_open: false)
# turing.polls << ux
# design = Poll.create(topic: 'Design concepts', user_id: 1, course_id: 2, is_open: false)
# turing.polls << design
# Poll.create(topic: 'AJAX', user_id: 3, course_id: 3, is_open: false)
# grace.polls << Poll.find_by_topic('AJAX')
# Poll.create(topic: 'Bootstrap', user_id: 3, course_id: 3, is_open: false)
# grace.polls << Poll.find_by_topic('Bootstrap')

# cool = Reply.create(poll_id: 4, user_id: 28, response: "4 I'm cool with it", from_number: 4154448888)
# cool.update(poll_id: 16)
