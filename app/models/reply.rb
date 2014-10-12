class Reply < ActiveRecord::Base

	belongs_to :poll
	## eventually
	# belongs_to :user OR :student

end
