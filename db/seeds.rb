# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Donor.create(first_name:"Main", last_name:"LifeSpan", date_of_birth:20.years.ago, phone:"97466090897", 
	email:"lifespan.donation@gmail.com", blood_type:"B+", 
	region:"West Bay", password:"lifespanproject1", 
	password_confirmation:"lifespanproject1", admin:true) 

Donor.create(first_name:"Donor", last_name:"Labrat", date_of_birth:17.years.ago, phone:"97466090897", 
	email:"book@gmail.com", blood_type:"A+", 
	region:"Al Dafna", password:"book12", 
	password_confirmation:"book12", admin:false) 

Donor.create(first_name:"Volunteer", last_name:"Second", date_of_birth:10.years.ago, phone:"97466090897", 
	email:"volume@gmail.com", blood_type:"O-",
	region:"Al Sadd",  password:"volume12", 
	password_confirmation:"volume12", admin:false) 

Donor.create(first_name:"Zakaria", last_name:"Labyad", date_of_birth:3.years.ago, phone:"97466090897", 
	email:"zak@gmail.com", blood_type:"A-", 
	region:"Al Nasr", password:"zak123", 
	password_confirmation:"zak123", admin:false) 

Donor.create(first_name:"Arjen", last_name:"Robben", date_of_birth:62.years.ago, phone:"97466090897", 
	email:"robben@gmail.com", blood_type:"B-", 
	region:"Al Waab", password:"robben123", 
	password_confirmation:"robben123", admin:false) 




Medic.create(first_name:"Aliya", last_name:"Hashim", date_of_birth:25.years.ago, organization_id:1,
email:"aliya.hashim@hotmail.com",
position:"Audiologist", admin:true, password:"aliya12",
password_confirmation:"aliya12")

Medic.create(first_name:"Ola", last_name:"Daher",  date_of_birth:11.years.ago, organization_id:1, email:"ola@gmail.com",
position:"Allergist", admin:false, password:"ola123",
password_confirmation:"ola123")

Medic.create(first_name:"Daniel", last_name:"Chweiky", date_of_birth:6.years.ago, organization_id:1,
email:"dan@gmail.com",
position:"Andrologist", admin:false, password:"dan123",
password_confirmation:"dan123")

Medic.create(first_name:"Srin", last_name:"Chakrav", date_of_birth:79.years.ago, organization_id:2,
email:"schakrav@cmu.edu",
position:"Anesthesiologist", admin:true, password:"schakrav19",
password_confirmation:"schakrav19")

Medic.create(first_name:"Aboudue", last_name:"Whodunnit", date_of_birth:21.years.ago, organization_id:2,
email:"abd@gmail.com",
position:"Cardiologist", admin:false, password:"abd123",
password_confirmation:"abd123")

Medic.create(first_name:"Homolika", last_name:"Komolika", date_of_birth:32.years.ago, organization_id:2,
email:"kasauti@gmail.com",
position:"Dentist", admin:false, password:"kasauti123",
password_confirmation:"kasauti123")

Organization.create(name:"", region:"West Bay", phone:"97466090820")

Organization.create(name:"Hamad Medical Corporation", region:"Al Bidda", phone:"74445632157")

Organization.create(name:"Al Ahli Hospital", region:"Al Dafna", phone:"97433190829")

Organization.create(name:"Doha Clinic", region:"Al Hilal", phone:"97466094441")







