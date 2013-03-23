FactoryGirl.define do
  factory :donor do
		active true
    donor  true
    blood_type  "A+"
    email  "donor@gmail.com"
    first_name  "Donor"
    last_name  "Donor"
    password  "123456"
    password_confirmation  "123456"
    phone  "974-44882054"
    region  "Al Dafnna"
    social_network  "Twitter"
	end
	
	factory :organization do
		name      "Hamad Medical Corporation"
		region    "Al Saad"
	end
end
