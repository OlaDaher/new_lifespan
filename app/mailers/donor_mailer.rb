class DonorMailer < ActionMailer::Base
  default from: "lifespan.donation@gmail.com"
  def new_donor_request(donor_par, medic, org, blood)
    @donorEmail = donor_par.reject {|s| s.authenticated == false }.map{|o| o.email}
    @medic_name = medic.proper_name
    @medic_org = org.name
    @medic_region = org.region
    @blood_needed = blood
    mail(:to => "lifespan.donation@gmail.com", :bcc => @donorEmail,
    :subject => "Blood Donation Request")
  end


  def password_resets_donor(donor)
    @donor = donor
    mail :to => donor.email, :subject => "Password Reset"
  end


  def donor_authentication(donor)
    @donor = donor
    mail(:to => @donor.email,
          :subject => "Activate LifeSpan+ Account!")
  end  

 
  # def password_reset(donor)
  #   @donor = donor
  #   mail :to => donor.email, :subject => "Password Reset"
  # end

end
