class Medic < ActiveRecord::Base
  # attr_accessible :email, :first_name, :last_name, :organization_id, :password, :password_confirmation, :position, :staff
  has_secure_password
  belongs_to :organization
  validates :email, :password, :password_confirmation, :first_name, :last_name, :organization_id, :position, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  # validates_inclusion_of :position, :in => %[Audiologist, Allergist, Andrologist, Anesthesiologist, Cardiologist, Dentist, Dermatologist, Emergency Doctor, Endocrinologist, ENT Specialist, Epidemiologist, Family Practician, Gastroenterologist, Geneticist, Gynecologist, Hematologist, Hepatologist, Immunologist, Infectious Disease Specialist, Internist, Internal Medicine Specialist, Microbiologist, Neonatologist, Nephrologist, Neurologist, Neurosurgeon, Obstetrician, Oncologist, Ophthalmologist, Orthopedic Surgeon, Perinatologist, Paleopathologist, Parasitologist, Pathologist, Pediatrician, Physiologist, Physiatrist, Plastic Surgeon, Podiatrists, Psychiatrist, Pulmonologist, Radiologists, Rheumatologsist, Surgeon, Urologist, Veterinarian], :message => "is not an option"
  Position = [[''], ['Audiologist'], ['Allergist'], ['Andrologist'], ['Anesthesiologist'], ['Cardiologist'], ['Dentist'], ['Dermatologist'], ['Emergency Doctor'], ['Endocrinologist'], ['ENT Specialist'], ['Epidemiologist'], ['Family Practician'], ['Gastroenterologist'], ['Geneticist'], ['Gynecologist'], ['Hematologist'], ['Hepatologist'], ['Immunologist'], ['Infectious Disease Specialist'], ['Internist'], ['Internal Medicine Specialist'], ['Microbiologist'], ['Neonatologist'], ['Nephrologist'], ['Neurologist'], ['Neurosurgeon'], ['Obstetrician'], ['Oncologist'], ['Ophthalmologist'], ['Orthopedic Surgeon'], ['Perinatologist'], ['Paleopathologist'], ['Parasitologist'], ['Pathologist'], ['Pediatrician'], ['Physiologist'], ['Physiatrist'], ['Plastic Surgeon'], ['Podiatrists'], ['Psychiatrist'], ['Pulmonologist'], ['Radiologists'], ['Rheumatologsist'], ['Surgeon'], ['Urologist'], ['Veterinarian']]

  def proper_name
    first_name + " " + last_name
  end 

  def name 
    last_name + ", " + first_name   
  end

end
