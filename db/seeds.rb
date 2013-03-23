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

Donor.create(first_name:"Life", last_name:"Span", phone:"97466090897", 
	email:"lifespan.donation@gmail.com", blood_type:"B+", social_network:"Facebook", 
	region:"West Bay", active:true, password:"lifespanproject1", 
	password_confirmation:"lifespanproject1", admin:true) 

Donor.create(first_name:"Ola", last_name:"Daher", phone:"97466177821", 
	email:"oladaher@gmail.com", blood_type:"B+", social_network:"Facebook", 
	region:"West Bay", active:true, password:"default", 
	password_confirmation:"default", admin:true) 

Donor.create(first_name:"Srin", last_name:"Chakrav", phone:"97455712997", 
	email:"aliya.hashim11@gmail.com", blood_type:"B+", social_network:"Facebook", 
	region:"West Bay", active:true, password:"default", 
	password_confirmation:"default", admin:true) 

  
  	
Medic.create(first_name:"Srin", last_name:"Chakrav", organization_id:1,
email:"aliya.hashim@hotmail.com",
position:"West Bay", admin:false, password:"default",
password_confirmation:"default")

Organization.create(name:"", region:"West Bay")





