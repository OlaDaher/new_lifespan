class Medic < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :email, :phone, :date_of_birth, :first_name, :last_name, :organization_id,
  :password, :password_confirmation, :position, :admin, :photo
  validates :password, :format => {:with => /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/, message: "may only contain letters, numbers, or underscores"}
  validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9])/, message: "must include one number and one letter"}
  validates_format_of :password, :with => /[A-Z]/, :message => " must have one upper case"
  validates :password, :presence => true,
                       :length => {:within => 6..40}
                 
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true
                       
  validates :password_confirmation, :presence => true                      

  validates_length_of :first_name, :last_name, :within => 2..20, :too_long => "must be shorter", :too_short => "must be longer", :allow_blank => true

  has_secure_password
  before_save :format_phone
  belongs_to :organization
  validates :email, :organization_id, :presence => true, :on => :create
  validates :date_of_birth, :phone, :first_name, :last_name, :presence => true, :on => :update 
  validates :email, uniqueness: true
  validates_format_of :phone, :with => /^(\+?\d{8}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 8 digits (country code not required)", :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validate :password_excludes_name
  before_create { generate_token(:auth_token) }
  
  Position = [[''], ['Administrator'], ['Audiologist'], ['Allergist'], ['Andrologist'], ['Anesthesiologist'], ['Cardiologist'], ['Dentist'], ['Dermatologist'], ['Emergency Doctor'], ['Endocrinologist'], ['ENT Specialist'], ['Epidemiologist'], ['Family Practician'], ['Gastroenterologist'], ['Geneticist'], ['Gynecologist'], ['Hematologist'], ['Hepatologist'], ['Immunologist'], ['Infectious Disease Specialist'], ['Internist'], ['Internal Medicine Specialist'], ['Microbiologist'], ['Neonatologist'], ['Nephrologist'], ['Neurologist'], ['Neurosurgeon'], ['Obstetrician'], ['Oncologist'], ['Ophthalmologist'], ['Orthopedic Surgeon'], ['Perinatologist'], ['Paleopathologist'], ['Parasitologist'], ['Pathologist'], ['Pediatrician'], ['Physiologist'], ['Physiatrist'], ['Plastic Surgeon'], ['Podiatrists'], ['Psychiatrist'], ['Pulmonologist'], ['Radiologist'], ['Rheumatologsist'], ['Surgeon'], ['Urologist'], ['Veterinarian']]


  def password_excludes_name
    code = password
    f_name = first_name
    l_name = last_name
    email_id = email
    if !(code && f_name && l_name && email_id)
      return false
    end  
    at_index = email_id.index('@')
    if at_index == nil
      return false
    end  
    username = email_id[0,at_index-1]

    if code.include?(username) || code.include?(f_name) || code.include?(l_name) == true
        errors.add(:password, "can't include your First Name, Last Name or Email!") 
    end
  end 
  
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

  def self.admins
    a = Array.new
    Medic.all.each do |medic|
      a << medic if medic.admin == true
    end
    return a
  end
  
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Medic.exists?(column => self[column])
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(validate: false)
    MedicMailer.password_reset(self).deliver
  end
  
private
  def format_phone
    phone = self.phone.to_s
    phone.gsub!(/[^0-9]/,"")
    self.phone = phone
  end

end
