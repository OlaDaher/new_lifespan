class Medic < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :email, :phone, :first_name, :last_name, :organization_id, :password, :password_confirmation, :position, :admin
  validates :password,   :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
  validates :password_confirmation, :presence => true                      
=======
  # attr_accessible :email, :first_name, :last_name, :organization_id, :password, :password_confirmation, :position, :staff
>>>>>>> 045a1ca26bc67fca28731d8477208ac5717eb59a
  has_secure_password
  before_save :format_phone
  belongs_to :organization
  validates :email, :organization_id, :position, :presence => true
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  # validates_inclusion_of :position, :in => %[Audiologist, Allergist, Andrologist, Anesthesiologist, Cardiologist, Dentist, Dermatologist, Emergency Doctor, Endocrinologist, ENT Specialist, Epidemiologist, Family Practician, Gastroenterologist, Geneticist, Gynecologist, Hematologist, Hepatologist, Immunologist, Infectious Disease Specialist, Internist, Internal Medicine Specialist, Microbiologist, Neonatologist, Nephrologist, Neurologist, Neurosurgeon, Obstetrician, Oncologist, Ophthalmologist, Orthopedic Surgeon, Perinatologist, Paleopathologist, Parasitologist, Pathologist, Pediatrician, Physiologist, Physiatrist, Plastic Surgeon, Podiatrists, Psychiatrist, Pulmonologist, Radiologists, Rheumatologsist, Surgeon, Urologist, Veterinarian], :message => "is not an option"
  Position = [[''], ['Audiologist'], ['Allergist'], ['Andrologist'], ['Anesthesiologist'], ['Cardiologist'], ['Dentist'], ['Dermatologist'], ['Emergency Doctor'], ['Endocrinologist'], ['ENT Specialist'], ['Epidemiologist'], ['Family Practician'], ['Gastroenterologist'], ['Geneticist'], ['Gynecologist'], ['Hematologist'], ['Hepatologist'], ['Immunologist'], ['Infectious Disease Specialist'], ['Internist'], ['Internal Medicine Specialist'], ['Microbiologist'], ['Neonatologist'], ['Nephrologist'], ['Neurologist'], ['Neurosurgeon'], ['Obstetrician'], ['Oncologist'], ['Ophthalmologist'], ['Orthopedic Surgeon'], ['Perinatologist'], ['Paleopathologist'], ['Parasitologist'], ['Pathologist'], ['Pediatrician'], ['Physiologist'], ['Physiatrist'], ['Plastic Surgeon'], ['Podiatrists'], ['Psychiatrist'], ['Pulmonologist'], ['Radiologists'], ['Rheumatologsist'], ['Surgeon'], ['Urologist'], ['Veterinarian']]

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
