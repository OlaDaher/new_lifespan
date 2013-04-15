class DonorMailer < ActionMailer::Base
  default from: "lifespan.donation@gmail.com"
  def new_donor_request(donor_par, medic, org, blood)
    @donorEmail = donor_par.map{|o| o.email}
    @medic_name = medic.proper_name
    @medic_org = org.name
    @medic_region = org.region
    @blood_needed = blood
    
    # @bloodtype = donor_par.map{|o| o.proper_name}
        mail(:to => "lifespan.donation@gmail.com", :bcc => @donorEmail,
        :subject => "Blood Donation Request")
  end
  
  def password_reset(donor)
    @donor = donor
    mail :to => donor.email, :subject => "Password Reset"
  end
end
