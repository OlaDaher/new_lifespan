class Donor < ActiveRecord::Base
  attr_accessible :active, :admin, :blood_type, :email, :first_name, :last_name, :password, :password_confirmation, :phone, :region, :social_network
  has_secure_password
  validates_presence_of :password, :on => :create
  before_save :format_phone
  validates :email, :first_name, :last_name, :password, :password_confirmation, :phone, :blood_type, :region, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
end
