class Publics::TestController < ApplicationController
	def show
		@user = User.find(params[:id])
		@currentUserEntry=Entry.where(user_id: current_user.id)
	    @userEntry=Entry.where(user_id: @user.id)
	    if @user.id == current_user.id
	    else
	      @currentUserEntry.each do |cu|
	        @userEntry.each do |u|
	          if cu.room_id == u.room_id then
	            @isRoom = true
	            @roomId = cu.room_id
	          end
	        end
	      end
	      if @isRoom
	      else
	        @room = Room.new
	        @entry = Entry.new
	      end
	    end
	end

	def create
		@room = Room.create
		@entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
		@entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
		redirect_to "/rooms/#{@room.id}"
	end
end
