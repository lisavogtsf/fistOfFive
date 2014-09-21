class SitesController < ApplicationController

	before_action :is_authenticated?
	before_filter :is_authenticated?, :except => :index

	def index

		
	end

end
