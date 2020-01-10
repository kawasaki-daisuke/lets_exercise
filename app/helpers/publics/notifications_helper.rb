module Publics::NotificationsHelper
	def notification_form(notification)
	  @comment=nil
	  user = User.find_by(id:notification.visitor_id)
	  post = Post.find_by(id:notification.post_id)
	  room = Room.find_by(id:notification.room_id)
	  visitor=link_to notification.visitor.name, publics_user_path(notification.visitor_id), style:"font-weight: bold;"
	  
	  case notification.action
	    when "follow" then
	      "#{visitor}があなたをフォローしました"
	    when "favorite" then
	    your_post=link_to 'あなたの投稿', publics_user_post_path(current_user,notification.post_id), style:"font-weight: bold;"
	      "#{visitor}が#{your_post}にいいね！しました"
	    when "comment" then
	    your_post=link_to 'あなたの投稿', publics_user_post_path(current_user,notification.post_id), style:"font-weight: bold;"
	      @comment=Comment.find_by(id:notification.comment_id)&.comment_content
	      "#{visitor}が#{your_post}にコメントしました"
		when "messege" then
			your_room=link_to 'あなたのチャットルーム', publics_room_path(current_user,notification.room.id), style:"font-weight: bold;"
		  "#{visitor}から#{your_room}にメッセージが届きました"
	  end
	end

	def unchecked_notifications
      @notifications=current_user.passive_notifications
	end
end
