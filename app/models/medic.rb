class Medic < ActiveRecord::Base

  attr_accessible :email, :phone, :first_name, :last_name, :organization_id, 
  :password, :password_confirmation, :position, :admin
  validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
  validates :password_confirmation, :presence => true                      

  validates_length_of :first_name, :last_name, :within => 2..20, :too_long => "must be shorter", :too_short => "must be longer", :allow_blank => true

  has_secure_password
  before_save :format_phone
  belongs_to :organization
  validates :email, :organization_id, :presence => true
  validates :email, uniqueness: true
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only", :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  before_create { generate_token(:auth_token) }
  
  Position = [[''], ['Audiologist'], ['Allergist'], ['Andrologist'], ['Anesthesiologist'], ['Cardiologist'], ['Dentist'], ['Dermatologist'], ['Emergency Doctor'], ['Endocrinologist'], ['ENT Specialist'], ['Epidemiologist'], ['Family Practician'], ['Gastroenterologist'], ['Geneticist'], ['Gynecologist'], ['Hematologist'], ['Hepatologist'], ['Immunologist'], ['Infectious Disease Specialist'], ['Internist'], ['Internal Medicine Specialist'], ['Microbiologist'], ['Neonatologist'], ['Nephrologist'], ['Neurologist'], ['Neurosurgeon'], ['Obstetrician'], ['Oncologist'], ['Ophthalmologist'], ['Orthopedic Surgeon'], ['Perinatologist'], ['Paleopathologist'], ['Parasitologist'], ['Pathologist'], ['Pediatrician'], ['Physiologist'], ['Physiatrist'], ['Plastic Surgeon'], ['Podiatrists'], ['Psychiatrist'], ['Pulmonologist'], ['Radiologists'], ['Rheumatologsist'], ['Surgeon'], ['Urologist'], ['Veterinarian']]

  def proper_name
    first_name + " " + last_name
  end 

  def name 
    last_name + ", " + first_name   
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
  
private
  def format_phone
     phone = self.phone.to_s
     phone.gsub!(/[^0-9]/,"")
      self.phone = phone
  end

end
