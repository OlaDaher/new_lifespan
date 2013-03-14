ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:user_name => "lifespan.donation@gmail.com",
:password => "lifespanproject1",
:authentication => "plain",
:enable_starttls_auto => true }