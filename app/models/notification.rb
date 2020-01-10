class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :room, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  def how_long_ago
	  if (Time.now - self.created_at) <= 60 * 60
	    
	    ((Time.now - self.created_at) / 60).to_i.to_s + "分前"
	  elsif (Time.now - self.created_at) <= 60 * 60 * 24
	    
	    ((Time.now - self.created_at) / 3600).to_i.to_s + "時間前"
	  elsif (Date.today - self.created_at.to_date) <= 30
	    
	    (Date.today - self.created_at.to_date).to_i.to_s + "日前"
	  else
	   
	  self.created_at
  	  end
  end
end
