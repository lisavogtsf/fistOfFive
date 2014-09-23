require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
	describe "GET #new, the login page" do
		it "should respond with 200 when user is not logged in" do 
			get :new
			expect(response.status).to eq(200)
		end
		it "should successfully render a template when user is not logged in" do 
			get :new
			expect(response).to render_template("new")
		end
	end
end
