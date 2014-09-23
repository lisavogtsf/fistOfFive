require 'rails_helper'

RSpec.describe Poll, :type => :model do
	it "should make a new poll without saving it" do 
		rails_poll = Poll.new(:topic => "Rails")
		expect(rails_poll.topic).to eq("Rails")
	end
	it "should create a poll in the database and have a user_id associated with it" do
		another_poll = Poll.create(:topic => "Angular", :user_id => "1")
		expect(another_poll.user_id).to eq("1")
	end
	it "should be able to update poll information" do 
		stock_poll = Poll.create(:topic => "Web", :user_id => "1")
		stock_poll.update(:topic => "HTTP")
		expect(stock_poll.topic).to eq("HTTP")
	end

end
