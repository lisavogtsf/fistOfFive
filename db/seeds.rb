# #sample users for fistOfFive
# turing = User.create(first_name: 'Alan', last_name: 'Turing', email: 'alan@alan.com', password: '4321alan', password_confirmation: '4321alan', sms_phone_number: '4159671051')
# grace = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'grace@grace.com', password: '4321grace', password_confirmation: '4321grace', sms_phone_number: '4159671051')
# ada = User.create(first_name: 'Ada', last_name: "Lovelace", email: 'ada@ada.com', password: '4321ada', password_confirmation: '4321ada', sms_phone_number: '4158465918')
# megan = User.create(first_name: 'Megan', last_name: "Smith", email: 'megan@megan.com', password: '4321megan', password_confirmation: '4321megan', sms_phone_number: '4159671051')
# pierre = User.create(first_name: 'Neil', last_name: "deGrasse Tyson", email: 'pierre@pierre.com', password: '4321pierre', password_confirmation: '4321pierre', sms_phone_number: '4159671051')

# uxdi = Course.create(title: 'UXDI', desc: 'User experience design immersive', schedule: 'SFJuly')
# wdi = Course.create(title: "WDI", desc: 'Web Development Immersive', schedule: 'SFAugust')
# mobile = Course.create(title: "Mobile Programming", desc: 'Programming for mobile devices', schedule: 'SFAugust', course_time_zone: 'UTC')
# product = Course.create(title: "Product Management", desc: 'Managing products is harder than it looks', schedule: 'SFNovember', course_time_zone: 'UTC')

# #for associating nicknames in console
# grace = User.find_by_email('grace@grace.com')
# turing = User.find_by_email('alan@alan.com')
# ada = User.find_by_email('ada@ada.com')
# megan = User.find_by_email('megan@megan.com')
# pierre = User.find_by_email('pierre@pierre.com')

# wdi = Course.find_by_title('WDI')
# uxdi = Course.find_by_title('UXDI')
# product = Course.find_by_title('Product Management')
# mobile = Course.find_by_title('Mobile Programming')

# # making associations etc
# turing.courses << uxdi 
# # uxdi.users << turing

# turing.courses << wdi
# # wdi.users << turing

# grace.courses << wdi
# # wdi.users << grace

# grace.courses << uxdi
# # uxdi.users << grace

# ada.courses << mobile
# # mobile.users << ada

# ada.courses << uxdi
# # uxdi.users << ada

# ada.courses << wdi
# # wdi.users << ada

# megan.courses << mobile
# # mobile.users << megan

# megan.courses << product
# # product.users << megan

# megan.courses << wdi
# # wdi.users << megan

# pierre.courses << product
# # product.users << pierre

# ux = Poll.create(topic: 'User Experience', user_id: User.find_by_email('alan@alan.com'), course_id: Course.find_by_title('UXDI'), is_open: false)
# uxdi.polls << ux
# turing.polls << ux

# design = Poll.create(topic: 'Design concepts', user_id: User.find_by_email('alan@alan.com'), course_id: Course.find_by_title('UXDI'), is_open: false)
# uxdi.polls << design
# turing.polls << design

# wdi.polls << Poll.create(topic: 'AJAX', user_id: User.find_by_email('grace@grace.com'), course_id: Course.find_by_title('WDI'), is_open: false)
# grace.polls << Poll.find_by_topic('AJAX')

# uxdi.polls << Poll.create(topic: 'Bootstrap', user_id: User.find_by_email('grace@grace.com'), course_id: Course.find_by_title('UXDI'), is_open: false)
# grace.polls << Poll.find_by_topic('Bootstrap')

# wdi.polls << Poll.create(topic: 'Algorithms', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('WDI'), is_open: false)
# ada.polls << Poll.find_by_topic('Bootstrap')

# wdi.polls << Poll.create(topic: 'User flow', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('UXDI'), is_open: false)
# ada.polls << Poll.find_by_topic('User flow')

# wdi.polls << Poll.create(topic: 'Node.js in the console', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('WDI'), is_open: false)
# ada.polls << Poll.find_by_topic('Node.js in the console')

# wdi.polls << Poll.create(topic: 'Command Line', user_id: User.find_by_email('ada@ada.com'), course_id: Course.find_by_title('WDI'), is_open: false)
# ada.polls << Poll.find_by_topic('Command Line')

# product.polls << Poll.create(topic: 'First day of product management', user_id: User.find_by_email('megan@megan.com'), course_id: Course.find_by_title('Product Management'), is_open: false)
# megan.polls << Poll.find_by_topic('First day of product management')

# product.polls << Poll.create(topic: 'Thinking like a programmer', user_id: User.find_by_email('pierre@pierre.com'), course_id: Course.find_by_title('Product Management'), is_open: false)
# pierre.polls << Poll.find_by_topic('Thinking like a programmer')



# cool = Reply.create(poll_id: 4, user_id: 28, response: "4 I'm cool with it", from_number: 4154448888)
# cool.update(poll_id: 16)
#<Reply id: 12, poll_id: 4, user_id: nil, response: "5 ", created_at: "2014-10-15 19:49:54", updated_at: "2014-10-15 19:49:54", from_number: "+14158465918"

# id: 12, poll_id: 4, user_id: nil, response: "5 ", created_at: "2014-10-15 19:49:54", updated_at: "2014-10-15 19:49:54", from_number: "+14158465918"

repl = Reply.create(poll_id: 1, user_id: nil, response: "5 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "5 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "3 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "3 ", from_number: "+14158465918")
polly = Poll.find_by_id(1)
polly.replies << repl

repl = Reply.create(poll_id: 1, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(4)
polly.replies << repl



variable = 2
repl = Reply.create(poll_id: variable, user_id: nil, response: "5 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "5 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "3 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "3 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl

repl = Reply.create(poll_id: variable, user_id: nil, response: "4 ", from_number: "+14158465918")
polly = Poll.find_by_id(variable)
polly.replies << repl