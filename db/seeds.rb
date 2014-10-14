# #sample users for fistOfFive
# turing = User.create(first_name: 'Alan', last_name: 'Turing', email: 'alan@alan.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4154448888')

# nacho = User.create(first_name: 'Ignacio', last_name: 'Iglesias', email: 'nacho@nacho.com', password: '4321', password_confirmation: '4321', sms_phone_number: '4158888888')
# grace = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'grace@grace.com', password: '1234', password_confirmation: '1234', sms_phone_number: '3335554433')
ada = User.create(first_name: 'Ada', last_name: "Lovelace", email: 'ada@ada.com', password: '4321', password_confirmation: '4321', sms_phone_number: '444-333-2222')
megan = User.create(first_name: 'Megan', last_name: "Smith", email: 'megan@megan.com', password: '4321', password_confirmation: '4321', sms_phone_number: '222-333-2222')
pierre = User.create(first_name: 'Pierre', last_name: "Gounod", email: 'pierre@pierre.com', password: '4321', password_confirmation: '4321', sms_phone_number: '555-333-2222')

# uxdi = Course.create(title: 'UXDI', desc: 'User experience design immersive', schedule: 'SFJuly')
# wdi = Course.create(title: "WDI", desc: 'Web Development Immersive', schedule: 'SFAugust')
mobile = Course.create(title: "Mobile Programming", desc: 'Programming for mobile devices', schedule: 'SFAugust', course_time_zone: 'UTC')
product = Course.create(title: "Product Management", desc: 'Managing products is harder than it looks', schedule: 'SFNovember', course_time_zone: 'UTC')

# for associating nicknames in console
# grace = User.find_by_email('grace@grace.com')
# nacho = User.find_by_email('nacho@nacho.com') 
# turing = User.find_by_email('alan@alan.com')
ada = User.find_by_email('ada@ada.com')
megan = User.find_by_email('megan@megan.com')
pierre = User.find_by_email('pierre@pierre.com')

wdi = Course.find_by_title('WDI')
uxdi = Course.find_by_title('UXDI')
product = Course.find_by_title('Product Management')
mobile = Course.find_by_title('Mobile Programming')

# making associations etc
# nacho.courses << uxdi
# turing.courses << uxdi 
# turing.courses << wdi
# grace.courses << wdi
# grace.courses << uxdi

ada.courses << mobile
ada.courses << uxdi
ada.courses << wdi
megan.courses << mobile
megan.courses << product
megan.courses << wdi
pierre.courses << product

# ux = Poll.create(topic: 'User Experience', user_id: 1, course_id: 2, is_open: false)
# turing.polls << ux
# design = Poll.create(topic: 'Design concepts', user_id: 1, course_id: 2, is_open: false)
# turing.polls << design
# Poll.create(topic: 'AJAX', user_id: 3, course_id: 3, is_open: false)
# grace.polls << Poll.find_by_topic('AJAX')
# Poll.create(topic: 'Bootstrap', user_id: 3, course_id: 3, is_open: false)
# grace.polls << Poll.find_by_topic('Bootstrap')

wdi.polls << Poll.create(topic: 'User flow', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('UXDI'), is_open: false)
ada.polls << Poll.find_by_topic('User flow')

wdi.polls << Poll.create(topic: 'Node.js in the console', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('WDI'), is_open: false)
ada.polls << Poll.find_by_topic('Node.js in the console')

wdi.polls << Poll.create(topic: 'Command Line', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('WDI'), is_open: false)
ada.polls << Poll.find_by_topic('Command Line')

product.polls << Poll.create(topic: 'First day of product management', user_id: User.find_by_email('megan@megan.com'), course_id: Course.find_by_title('Product Management'), is_open: false)
megan.polls << Poll.find_by_topic('First day of product management')

product.polls << Poll.create(topic: 'Thinking like a programmer', user_id: User.find_by_email('pierre@pierre.com'), course_id: Course.find_by_title('Product Management'), is_open: false)
pierre.polls << Poll.find_by_topic('Thinking like a programmer')



# cool = Reply.create(poll_id: 4, user_id: 28, response: "4 I'm cool with it", from_number: 4154448888)
# cool.update(poll_id: 16)
