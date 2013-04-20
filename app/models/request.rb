class Request < ActiveRecord::Base
  attr_accessible :content, :posted_at
  scope :last_24hours, lambda {where("created_at > ?", 1.day.ago)}
  
end
