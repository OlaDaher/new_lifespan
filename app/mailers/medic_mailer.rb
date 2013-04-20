class MedicMailer < ActionMailer::Base
    default from: "lifespan.donation@gmail.com"

    def password_reset(medic)
      @medic = medic
      mail :to => medic.email, :subject => "Password Reset"
    end
end
