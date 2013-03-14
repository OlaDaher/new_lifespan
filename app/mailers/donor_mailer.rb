class DonorMailer < ActionMailer::Base
  default from: "lifespan.donation@gmail.com"
  def new_donor_request(donor_par)
    @donorEmail = donor_par.map{|o| o.email}  		
      # @donors = Donor.all
      # <form id="contactForm" method="post"
      #     action="<?php echo $this->getUrl('donors/send') ?>">
      # if () wont work with more than 500
        mail(:to => "lifespan.donation@gmail.com", :bcc => @donorEmail,
        :subject => "Blood Donation Request")
  end
end
