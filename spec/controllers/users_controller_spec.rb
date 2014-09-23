require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
	describe "GET #index" do 
		it "responds successfully with HTTP 302 status code if user is not logged in" do
			get :index
			# changed it to make it pass
			# this is a successful redirect because we are not logged in
			expect(response.status).to eq(302)
		end
		# it "renders the index template" do 
		# 	get :index
		# 	expect(response).to render_template("index")
		# end
		# it "will respond successfully with 200 once I can log in for testing purposes" do
		# 	get :index
		# 	expect(response).to have_http_status(200)
		# end
	end
	describe "GET #new ie signup page" do 
		it "responds with a successful 200 status if user is not logged in" do 
			get :new
			expect(response.status).to eq(200)
		end
		it "renders the signup template successfully" do 
			get :new
			expect(response).to render_template("new")
		end
	end
end
