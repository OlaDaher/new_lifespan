class Donor < ActiveRecord::Base

 attr_accessible :blood_type, :date_of_birth,
 :email, :first_name, :last_name, :password, :password_confirmation,
 :phone, :region, :photo, :admin, :confirmation_code, :authenticated

  validates :password, :format => {:with => /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/, message: "may only contain letters, digits, or underscores"}, :on => :update,
                       :if => :password     
  validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9])/, message: "must include one number and one letter"}, :on => :update,
                       :if => :password    
  validates_format_of :password, :with => /[A-Z]/, :message => " must have one upper case", :on =>  :update,
                       :if => :password   
  
  validates :password, :format => {:with => /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/, message: "may only contain letters, digits, or underscores"}, :on => :create     
  validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9])/, message: "must include one number and one letter"}, :on => :create    
  validates_format_of :password, :with => /[A-Z]/, :message => " must have one upper case", :on =>  :create    
  validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :update,
                       :if => :password

  validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :create                     
                

  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update

  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :create

  
  validates :password_confirmation, :presence => true, :on => :update,
                       :if => :password  
  validates :password_confirmation, :presence => true, :on => :create                  

  validates_length_of :first_name, :last_name, :within => 2..20, :too_long => "must be shorter", :too_short => "must be longer"

  mount_uploader :photo, PhotoUploader
	
  before_create { generate_token(:auth_token) }
  before_create :set_confirmation_code
  has_secure_password
  before_save :format_phone
  validates :email, :first_name, :last_name, :date_of_birth, :phone, :blood_type, :region, :presence => true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{8}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 8 digits (country code not required)"

  Region_List = [[''], ['Al Assiry'],  ['Al Bidda'], ['Al Dafna'], ['Al Hilal'], ['Al Mamoura'], ['Al Mansoura'], ['Al Markhiya'], ['Al Mirqab Al Jadeed'], ['Al Muntazah'], ['Al Nasr'], ['Al Rayyan'], ['Al Sadd'], ['Al Waab'], ['Bin Mahmoud'], ['Madinat Khalifa'], ['Old Airport'], ['Onaiza'], ['Qutaifiya'], ['Ras Abu Aboud'], ['Rumeilah'], ['Wadi Al Sail'], ['West Bay']]
  Blood_List = [[''], ['A+'], ['A-'], ['B+'], ['B-'], ['AB+'], ['AB-'], ['O+'], ['O-']]
  Social_Networks = [[''], ['Facebook'], ['Twitter']]


  def proper_name
    first_name + " " + last_name
  end 

  def name 
    last_name + ", " + first_name   
  end

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
  end 

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Donor.exists?(column => self[column])
  end

  def set_confirmation_code
    generate_token(:confirmation_code)
    self.authenticated = false
    return
  end

  def send_password_resets_donor
    generate_token(:password_reset_token)
    self.password_resets_donor_sent_at = Time.zone.now
    save!
    DonorMailer.password_resets_donor(self).deliver
  end

  # def initialize(bloodtype)
  #     client = Savon::Client.new("http://wsparam.strikeiron.com/SMSALERTS4?WSDL")
  #     response = client.request :str, :SendMessage, body: { "UnregisteredUserEmail" => "cheweiky@cmu.edu","UserID" => "0601B029CAAB6B0BC04D", "ToNumber" => "0097433497907", "FromName" => "LifeSpan+" , "MessageText" => "O+ is needed at Hamad." , "OptionalTextFormat" =>"Unicode"}
  #   end

  
  def initializeSMS(bloodtype, org, orgPhone, donorPhone)
    client = Savon.client(wsdl: "http://wsparam.strikeiron.com/SMSALERTS4?WSDL")
    # Savon::Client.new("http://wwww.ws.strikeiron.com/SMSALERTS4?WSDL")
        # client = Savon.client(wsdl: "http://wsparam.strikeiron.com/SMSALERTS4?WSDL")
    response = client.call(:send_message, message: { "UnregisteredUserEmail" => "cheweiky@cmu.edu","UserID" => "0601B029CAAB6B0BC04D", "ToNumber" => "#{donorPhone}", "FromName" => "LifeSpan+" , "MessageText" => "#{bloodtype} is needed at #{org} Tel:#{orgPhone}" , "OptionalTextFormat" =>"Unicode"})
  end


  private

    def format_phone
      phone = self.phone.to_s
      phone.gsub!(/[^0-9]/,"")
      self.phone = phone
    end
end
 

