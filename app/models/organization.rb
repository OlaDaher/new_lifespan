class Organization < ActiveRecord::Base
  attr_accessible :name, :region
  validates :name, :region, :presence => true
end
