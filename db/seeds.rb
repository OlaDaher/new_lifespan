
Medic.create!(first_name:"Tridas", last_name:"Mukhopadhyay", date_of_birth:52.years.ago, phone:"66090897", 
organization_id:1, email:"chaxz93@gmail.com", position:"Audiologist", admin:true, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Divakaran", last_name:"Liginlal", date_of_birth:45.years.ago, phone:"66090897",
organization_id:1, email:"chaxz@cmu.edu", position:"Allergist", admin:false, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Yazan", last_name:"Hijleh", date_of_birth:22.years.ago, phone:"66090897",
organization_id:2, email:"chaxz93@live.com", position:"Andrologist", admin:true, password:"Default123",
password_confirmation:"Default123")

Donor.create!(first_name:"System", last_name:"Admin", date_of_birth:17.years.ago, phone:"97800044", 
	email:"lifespan.donation@gmail.com", blood_type:"A-", weight: 51, gender: "Other", 
	region:"Madinat Khalifa", password:"Default123", 
	password_confirmation:"Default123", admin:true) 

Donor.create!(first_name:"Maher", last_name:"Hakim", authenticated:true, date_of_birth:47.years.ago, phone:"66090897", 
email:"schakrav@qatar.cmu.edu", blood_type:"A+", weight: 74, gender: "Male",  
region:"Al Assiry", password:"Default123", 
password_confirmation:"Default123", admin:false) 

Donor.create!(first_name:"Ray", last_name:"Tsai", authenticated:true, date_of_birth:61.years.ago, phone:"66090897", 
email:"acheweiky@gmail.com", blood_type:"B-", weight: 55, gender: "Male",  
region:"Al Bidda", password:"Default123",
password_confirmation:"Default123", admin:false) 

Donor.create!(first_name:"Daniel", last_name:"Phelps", authenticated:true, date_of_birth:33.years.ago, phone:"44548624", 
email:"dcheweik@qatar.cmu.edu", blood_type:"B+", weight: 68, gender: "Male",  
region:"Al Dafna", password:"Default123", 
password_confirmation:"Default123", admin:false) 

Donor.create!(first_name:"Selma", last_name:"Mansar", authenticated:true, date_of_birth:41.years.ago, phone:"44548650", 
email:"cheweiky@cmu.edu", blood_type:"O-", weight: 76, gender: "Female",  
region:"Al Mamoura", password:"Default123", 
password_confirmation:"Default123", admin:false) 

Organization.create!(name:"Al Ahli Hospital", region:"Wadi Al Sail", website:"http://www.ahlihospital.com", phone:"44898888", email:"info@ahlihospital.com")
Organization.create!(name:"Al Emadi Hospital", region:"Al Hilal", website:"http://www.alemadihospital.com.qa", phone:"44666009", email:"info@alemadihospital.com.qa")
Organization.create!(name:"Doha Clinic", region:"Al Mirqab Al Jadeed", website:"http://www.doha-hospital.com", phone:"44384333", email:"dohaclnk@qatar.net.qa")
Organization.create!(name:"Hamad General Hospital", region:"Al Rayyan", website:"http://www.hmc.org.qa", phone:"44394444", email:"webmaster@hgh.org.qa")
Organization.create!(name:"The American Hospital", region:"Al Assiry", website:"http://www.ahqatar.com", phone:"44421999", email:"mktg@ahdubai.com")
Organization.create!(name:"The Apollo Clinic", region:"Al Muntazah", website:"http://www.apolloqatar.com", phone:"44418441", email:"contact@apolloqatar.com")