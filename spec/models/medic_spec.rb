require 'spec_helper'
# require 'factory_girl'

describe Medic do
  before(:each) do
    @attr = {
     :email => "ahashim@qatar.cmu.edu",
     :first_name => "Aliya",
     :last_name => "Hashim",
     :organization_id => 1,
     :password => "123456",
     :password_confirmation => "123456",
     :position => "Position",
     :staff => true }
    end
    
    describe "Testing the presence of all required attributes" do
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:password)}
      it {should validate_presence_of(:password_confirmation)}
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:organization_id)}
      it {should validate_presence_of(:position)}
    end
    
    describe "Validating email" do
      describe "Validate good email" do
        it {should allow_value("email@aliya.com").for(:email)}
        it {should allow_value("email@aliya123.gov").for(:email)}
        it {should allow_value("email-hashim-11@aliya.com").for(:email)}
        it {should allow_value("a1990@email.org").for(:email)}
      end
      describe "Reject bad email" do
        it {should_not allow_value("email.fred.edu").for(:email)}
        it {should_not allow_value("email.com").for(:email)}
        it {should_not allow_value("655437.fred.org").for(:email)}
        it {should_not allow_value("email,hashim@fred.com").for(:email)}
        it {should_not allow_value("email,com").for(:email)}
        it {should_not allow_value("fred").for(:email)}
        it {should_not allow_value("fred@fred,com").for(:email)}
        it {should_not allow_value("fred@fred.uk").for(:email)}
        it {should_not allow_value("email hashim@fred.com").for(:email)}
        it {should_not allow_value("fred.fred.com").for(:email)}
      end
    end

    describe "Valiodating position" do  
      describe "Validate correct position"do
    	  it {should allow_value("Audiologist").for(:position)}
    	  it {should allow_value("Allergist").for(:position)}
    	  it {should allow_value("Andrologist").for(:position)}
    	  it {should allow_value("Anesthesiologist").for(:position)}
    	  it {should allow_value("Cardiologist").for(:position)}
    	  it {should allow_value("Dentist").for(:position)}
    	  it {should allow_value("Dermatologist").for(:position)}
    	  it {should allow_value("Emergency Doctor").for(:position)}
    	  it {should allow_value("Endocrinologist").for(:position)}
    	  it {should allow_value("ENT Specialist").for(:position)}
    	  it {should allow_value("Epidemiologist").for(:position)}
    	  it {should allow_value("Family Practician").for(:position)}
    	  it {should allow_value("Gastroenterologist").for(:position)}
    	  it {should allow_value("Geneticist").for(:position)}
    	  it {should allow_value("Gynecologist").for(:position)}
    	  it {should allow_value("Hematologist").for(:position)}
    	  it {should allow_value("Hepatologist").for(:position)}
    	  it {should allow_value("Immunologist").for(:position)}
    	  it {should allow_value("Infectious Disease Specialist").for(:position)}
    	  it {should allow_value("Internist").for(:position)}
    	  it {should allow_value("Internal Medicine Specialist").for(:position)}
    	  it {should allow_value("Microbiologist").for(:position)}
    	  it {should allow_value("Neonatologist").for(:position)}
    	  it {should allow_value("Nephrologist").for(:position)}
    	  it {should allow_value("Neurologist").for(:position)}
    	  it {should allow_value("Neurosurgeon").for(:position)}
    	  it {should allow_value("Obstetrician").for(:position)}
    	  it {should allow_value("Oncologist").for(:position)}
    	  it {should allow_value("Ophthalmologist").for(:position)}
    	  it {should allow_value("Orthopedic Surgeon").for(:position)}
    	  it {should allow_value("Perinatologist").for(:position)}
    	  it {should allow_value("Paleopathologist").for(:position)}
    	  it {should allow_value("Parasitologist").for(:position)}
    	  it {should allow_value("Pathologist").for(:position)}
    	  it {should allow_value("Pediatrician").for(:position)}
    	  it {should allow_value("Physiologist").for(:position)}
    	  it {should allow_value("Physiatrist").for(:position)}
    	  it {should allow_value("Plastic Surgeon").for(:position)}
    	  it {should allow_value("Podiatrists").for(:position)}
    	  it {should allow_value("Psychiatrist").for(:position)}
    	  it {should allow_value("Pulmonologist").for(:position)}
    	  it {should allow_value("Radiologists").for(:position)}
    	  it {should allow_value("Rheumatologsist").for(:position)}
    	  it {should allow_value("Surgeon").for(:position)}
    	  it {should allow_value("Urologist").for(:position)}
    	  it {should allow_value("Veterinarian").for(:position)}
      end

      # describe "Reject wrong position"do
      #   it {should_not allow_value("UK").for(:position)}
      #   it {should_not allow_value("USA").for(:position)}
      # end
    end
    

    
  
end
