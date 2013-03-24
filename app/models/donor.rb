class Donor < ActiveRecord::Base

 attr_accessible :active, :donor, :blood_type, 
 :email, :first_name, :last_name, :password, :password_confirmation, 
 :phone, :region, :social_network, :photo

  validates :password,   :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
  validates :password_confirmation, :presence => true                     

  mount_uploader :photo, PhotoUploader
	
  
  has_secure_password
  before_save :format_phone
  validates :email, :active, :social_network, :first_name, :last_name, :phone, :blood_type, :region, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"

  
  

  # validates_inclusion_of :region, :in => %['Al Assiry', 'Al Bidda', 'Al Dafna', 'Al Hilal', 'Al Mamoura', 'Al Markhiya', 'Al Nasr', 'Al Sadd', 'Al Waab', 'Bin Mahmoud', 'Madinat Khalifa', 'Old Airport', 'Onaiza', 'Qutaifiya', 'Ras Abu Aboud', 'Rumeilah', 'Wadi Al Sail', 'West Bay'], :message => "is not an option"
  # validates_inclusion_of :blood_type, :in => %['A+', 'A-', 'B+', 'AB+', 'AB-', 'O+', 'O-'], :message => "is not an option"
  # validates_inclusion_of :social_network, :in => %['Facebook', 'Twitter'], :message => "is not an option"

  Region_List = [[''], ['Al Assiry'],  ['Al Bidda'], ['Al Dafna'], ['Al Hilal'], ['Al Mamoura'], ['Al Markhiya'], ['Al Nasr'], ['Al Sadd'], ['Al Waab'], ['Bin Mahmoud'], ['Madinat Khalifa'], ['Old Airport'], ['Onaiza'], ['Qutaifiya'], ['Ras Abu Aboud'], ['Rumeilah'], ['Wadi Al Sail'], ['West Bay']]
  Blood_List = [[''], ['A+'], ['A-'], ['B+'], ['B-'], ['AB+'], ['AB-'], ['O+'], ['O-']]
  Social_Networks = [[''], ['Facebook'], ['Twitter']]


  def proper_name
    first_name + " " + last_name
  end 

  def name 
    last_name + ", " + first_name   
  end

  private
  
    def format_phone
     phone = self.phone.to_s
     phone.gsub!(/[^0-9]/,"")
      self.phone = phone
    end
end
