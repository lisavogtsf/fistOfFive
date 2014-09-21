class SitesController < ApplicationController

	before_action :is_authenticated?
	# before_filter :is_authenticated?, :except => :index

	def index
		render text: "Hi #{current_user.email}!! This note is in the Site controller"
		
	end

end
