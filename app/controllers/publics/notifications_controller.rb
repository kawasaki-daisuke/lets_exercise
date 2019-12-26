class Publics::NotificationsController < ApplicationController
	def index
	    @notifications = Notification.where(visited_id: current_user.id)
	    @notifications.where(checked: false).each do |notification|
	      notification.update_attributes(checked: true)
	    end
	end
end
