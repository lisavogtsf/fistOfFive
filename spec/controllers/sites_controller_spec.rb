require 'rails_helper'


RSpec.describe SitesController, :type => :controller do
	describe "GET #index" do 
		it "responds successfully with HTTP 200 status code" do
			get :index
			expect(response.status).to eq(200)
			# expect(response).to be_success
			# expect(response).to have_http_status(200)
		end
end
