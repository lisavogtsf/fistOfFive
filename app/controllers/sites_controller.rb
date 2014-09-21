class SitesController < ApplicationController

	## Sites Controller directs to the root page which does not require security.  The only concern is that logged in users should not be able to logon again

	# before_action :is_authenticated?
	# before_filter :is_authenticated?, :except => :index

	def index

	end

end
