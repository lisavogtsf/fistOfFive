require 'rails_helper'

RSpec.describe SitesController, :type => :controller do
	describe "Go to homepage" do
		it "should respond with successful 200" do 
			get :index
			expect(response.status).to eq(200)
		end
		it "should successfully render the index template" do 
			get :index
			expect(response).to render_template("index")
		end
	end
end
