class Reply < ActiveRecord::Base

	belongs_to :poll
	belongs_to :user 

end
