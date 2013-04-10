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

Donor.create(first_name:"Main", last_name:"LifeSpan", phone:"97466090897", 
	email:"lifespan.donation@gmail.com", blood_type:"B+", social_network:"Facebook", 
	region:"West Bay", active:true, password:"lifespanproject1", 
	password_confirmation:"lifespanproject1", admin:true) 

Donor.create(first_name:"Donor", last_name:"Labrat", phone:"97466090897", 
	email:"book@gmail.com", blood_type:"A+", social_network:"Twitter", 
	region:"Al Dafna", active:true, password:"book12", 
	password_confirmation:"book12", admin:false) 

Donor.create(first_name:"Volunteer", last_name:"Second", phone:"97466090897", 
	email:"volume@gmail.com", blood_type:"O-", social_network:"Facebook", 
	region:"Al Sadd", active:true, password:"volume12", 
	password_confirmation:"volume12", admin:false) 

Donor.create(first_name:"Zakaria", last_name:"Labyad", phone:"97466090897", 
	email:"zak@gmail.com", blood_type:"A-", social_network:"Twitter", 
	region:"Al Nasr", active:true, password:"zak123", 
	password_confirmation:"zak123", admin:false) 

Donor.create(first_name:"Arjen", last_name:"Robben", phone:"97466090897", 
	email:"robben@gmail.com", blood_type:"B-", social_network:"Facebook", 
	region:"Al Waab", active:true, password:"robben123", 
	password_confirmation:"robben123", admin:false) 




Medic.create(first_name:"Aliya", last_name:"Hashim", organization_id:1,
email:"aliya.hashim@hotmail.com",
position:"Audiologist", admin:true, password:"aliya12",
password_confirmation:"aliya12")

Medic.create(first_name:"Ola", last_name:"Daher", organization_id:1,
email:"ola@gmail.com",
position:"Allergist", admin:false, password:"ola123",
password_confirmation:"ola123")

Medic.create(first_name:"Daniel", last_name:"Chweiky", organization_id:1,
email:"dan@gmail.com",
position:"Andrologist", admin:false, password:"dan123",
password_confirmation:"dan123")

Medic.create(first_name:"Srin", last_name:"Chakrav", organization_id:2,
email:"schakrav@cmu.edu",
position:"Anesthesiologist", admin:true, password:"schakrav19",
password_confirmation:"schakrav19")

Medic.create(first_name:"Aboudue", last_name:"Whodunnit", organization_id:2,
email:"abd@gmail.com",
position:"Cardiologist", admin:false, password:"abd123",
password_confirmation:"abd123")

Medic.create(first_name:"Homolika", last_name:"Komolika", organization_id:2,
email:"kasauti@gmail.com",
position:"Dentist", admin:false, password:"kasauti123",
password_confirmation:"kasauti123")

Organization.create(name:"", region:"West Bay", phone:"97466090820")

Organization.create(name:"Hamad Medical Corporation", region:"Al Bidda", phone:"74445632157")

Organization.create(name:"Al Ahli Hospital", region:"Al Dafna", phone:"97433190829")

Organization.create(name:"Doha Clinic", region:"Al Hilal", phone:"97466094441")







