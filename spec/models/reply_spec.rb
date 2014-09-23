require 'rails_helper'

RSpec.describe Reply, :type => :model do
  it "should make a new reply without saving it" do 
  	repple = Reply.new(:response => "4")
  	expect(repple.response).to eq("4")
  end
  it "should create a reply and save it with poll_id" do 
  	ripple = Reply.create(:response => "3", :poll_id => 4)
  	found = Reply.find_by_response("3")
  	expect(found.poll_id).to eq(4)
  end
end
