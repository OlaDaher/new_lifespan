
Medic.create!(first_name:"Tridas", last_name:"Mukhopadhyay", date_of_birth:52.years.ago, phone:"66090897", 
organization_id:1, email:"tridas@cmu.edu", position:"Audiologist", admin:true, password:"Tridas123",
password_confirmation:"Tridas123")

Medic.create!(first_name:"Divakaran", last_name:"Liginlal", date_of_birth:45.years.ago, phone:"66090897",
organization_id:1, email:"liginlal@cmu.edu", position:"Allergist", admin:false, password:"Lal123",
password_confirmation:"Lal123")

Medic.create!(first_name:"Yazan", last_name:"Hijleh", date_of_birth:22.years.ago, phone:"66090897",
organization_id:2, email:"yna2@cmu.edu", position:"Andrologist", admin:true, password:"Yazan123",
password_confirmation:"Yazan123")

Donor.create!(first_name:"Life", last_name:"Span", date_of_birth:Date.parse("2013/04/21"), phone:"97800044", 
	email:"lifespan.donation@gmail.com", blood_type:"A-", 
	region:"Madinat Khalifa", password:"Lifespanproject1", 
	password_confirmation:"Lifespanproject1", admin:true) 

Donor.create!(first_name:"Maher", last_name:"Hakim", date_of_birth:47.years.ago, phone:"66090897", 
email:"mhakim@qatar.cmu.edu", blood_type:"A+", 
region:"Al Assiry", password:"Maher123", 
password_confirmation:"Maher123", admin:false) 

Donor.create!(first_name:"Ray", last_name:"Tsai", date_of_birth:61.years.ago, phone:"44548631", 
email:"ritsai@qatar.cmu.edu", blood_type:"B-", 
region:"Al Bidda", password:"Ray123", 
password_confirmation:"Ray123", admin:false) 

Donor.create!(first_name:"Daniel", last_name:"Phelps", date_of_birth:33.years.ago, phone:"44548624", 
email:"dphelps@cmu.edu", blood_type:"B+", 
region:"Al Dafna", password:"Dan123", 
password_confirmation:"Dan123", admin:false) 

Donor.create!(first_name:"Selma", last_name:"Mansar", date_of_birth:41.years.ago, phone:"44548650", 
email:"selmal@andrew.cmu.edu", blood_type:"O-", 
region:"Al Mamoura", password:"Selma123", 
password_confirmation:"Selma123", admin:false) 

Organization.create!(name:"Al Ahli Hospital", region:"Wadi Al Sail", website:"http://www.ahlihospital.com", phone:"44898888", email:"info@ahlihospital.com")
Organization.create!(name:"Al Emadi Hospital", region:"Al Hilal", website:"http://www.alemadihospital.com.qa", phone:"44666009", email:"info@alemadihospital.com.qa")
Organization.create!(name:"Doha Clinic", region:"Al Mirqab Al Jadeed", website:"http://www.doha-hospital.com", phone:"44384333", email:"dohaclnk@qatar.net.qa")
Organization.create!(name:"Hamad General Hospital", region:"Al Rayyan", website:"http://www.hmc.org.qa", phone:"44394444", email:"webmaster@hgh.org.qa")
Organization.create!(name:"The American Hospital", region:"Al Assiry", website:"http://www.ahqatar.com", phone:"44421999", email:"mktg@ahdubai.com")
Organization.create!(name:"The Apollo Clinic", region:"Al Muntazah", website:"http://www.apolloqatar.com", phone:"44418441", email:"contact@apolloqatar.com")