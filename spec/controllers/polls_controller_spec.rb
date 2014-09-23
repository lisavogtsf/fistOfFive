require 'rails_helper'

RSpec.describe PollsController, :type => :controller do
	## requires login
	# describe "GET show specific poll" do 
	# 	it "should respond successfully to a get request, with 200" do
	# 		fake_user = User.create(:email => "joe@joe.com", :password => "1234", :password_confirmation => "1234")
	# 		polly = Poll.create(:topic => "rails", :user_id => "1")
	# 		fake_user.polls << polly
	# 		get :show
	# 		expect(Poll.count).to eq(1)
	# 		expect(response.status).to eq(200)
	# 	end
	# end
end
