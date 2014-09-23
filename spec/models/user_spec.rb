require 'rails_helper'
require 'pry-rails'

RSpec.describe User, :type => :model do
	it "should create a new user without save" do
		grace = User.new(:email => "grace@hopper.com")
		expect(grace.new_record?).to eq(true)
		expect(grace.email).to eq("grace@hopper.com")
	end
	it "should create a user & password the save to the database" do 
		grace = User.new(:email => "grace@hopper.com", :password => 1234, :password_confirmation => 1234)
		grace.save!
		found_grace = User.find_by_email("grace@hopper.com")
		expect(found_grace["email"]).to eq("grace@hopper.com")
	end

end
