Organization.create!(name:"Al Emadi Hospital", region:"Al Hilal", website:"http://www.alemadihospital.com.qa", phone:"44666009", email:"info@alemadihospital.com.qa")
Organization.create!(name:"Al Ahli Hospital", region:"Wadi Al Sail", website:"http://www.ahlihospital.com", phone:"44898888", email:"info@ahlihospital.com")
Organization.create!(name:"Hamad General Hospital", region:"Al Rayyan", website:"http://www.hmc.org.qa", phone:"44394444", email:"webmaster@hgh.org.qa")
Organization.create!(name:"Doha Clinic", region:"Al Mirqab Al Jadeed", website:"http://www.doha-hospital.com", phone:"44384333", email:"dohaclnk@qatar.net.qa")
Organization.create!(name:"The American Hospital", region:"Al Assiry", website:"http://www.ahqatar.com", phone:"44421999", email:"mktg@ahdubai.com")
Organization.create!(name:"The Apollo Clinic", region:"Al Muntazah", website:"http://www.apolloqatar.com", phone:"44418441", email:"contact@apolloqatar.com")

Medic.create!(first_name:"Tridas", last_name:"Mukhopadhyay", date_of_birth:52.years.ago, phone:"66090897", 
organization_id:1, email:"tridas@cmu.edu", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")


Medic.create!(first_name:"Divakaran", last_name:"Liginlal", date_of_birth:45.years.ago, phone:"66090897",
organization_id:2, email:"liginlal@cmu.edu", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Hashim", last_name:"Aliya", date_of_birth:21.years.ago, phone:"66090897",
organization_id:2, email:"aliya.hashim11@gmail.com", position:"ENT Specialist", admin:false, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Daher", last_name:"Ola", date_of_birth:22.years.ago, phone:"66090897",
organization_id:2, email:"oladaher@gmail.com", position:"Dentist", admin:false, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Cheweiky", last_name:"Aboudue", date_of_birth:23.years.ago, phone:"66090897",
organization_id:2, email:"acheweiky@gmail.com", position:"Neurosurgeon", admin:false, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Nimmy", last_name:"Murali", date_of_birth:24.years.ago, phone:"66090897",
organization_id:2, email:"nimmym.10@gmail.com", position:"Pediatrician", admin:false, password:"Default123",
password_confirmation:"Default123")



Medic.create!(first_name:"Yazan", last_name:"Hijleh", date_of_birth:22.years.ago, phone:"66090897",
organization_id:3, email:"yna2@cmu.edu", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Aisha", last_name:"Hasan", date_of_birth:25.years.ago, phone:"66090897",
organization_id:3, email:"predatorontheprey@gmail.com", position:"Radiologist", admin:false, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Shaileja", last_name:"Relwani", date_of_birth:18.years.ago, phone:"66090897",
organization_id:3, email:"cnotes75@gmail.com", position:"Cardiologist", admin:false, password:"Default123",
password_confirmation:"Default123")



Medic.create!(first_name:"Talal", last_name:"Shoeb", date_of_birth:20.years.ago, phone:"66090897",
organization_id:4, email:"talalhotstar@gmail.com", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Nabil", last_name:"Shoeb", date_of_birth:21.years.ago, phone:"66090897",
organization_id:5, email:"nabilshoaib@gmail.com", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")

Medic.create!(first_name:"Noshin", last_name:"Nisa", date_of_birth:19.years.ago, phone:"66090897",
organization_id:6, email:"nisanoshin@gmail.com", position:"Administrator", admin:true, password:"Default123",
password_confirmation:"Default123")




Donor.create!(first_name:"System", last_name:"Admin", date_of_birth:17.years.ago, phone:"97800044", 
	email:"lifespan.donation@gmail.com", blood_type:"A-", weight: 51, gender: "Other", 
	region:"Madinat Khalifa", password:"Default123", 
	password_confirmation:"Default123", admin:true) 


Donor.create!(first_name:"Maher", last_name:"Hakim", date_of_birth:47.years.ago, phone:"66090897", 
email:"mhakim@qatar.cmu.edu", blood_type:"A+", weight: 74, gender: "Male",  
region:"Al Assiry", password:"Default123", 
password_confirmation:"Default123", admin:false, authenticated:true) 

Donor.create!(first_name:"Ray", last_name:"Tsai", date_of_birth:61.years.ago, phone:"44548631", 
email:"ritsai@qatar.cmu.edu", blood_type:"B-", weight: 55, gender: "Male",  
region:"Al Bidda", password:"Default123", 
password_confirmation:"Default123", admin:false, authenticated:true) 

Donor.create!(first_name:"Daniel", last_name:"Phelps", date_of_birth:33.years.ago, phone:"44548624", 
email:"dphelps@cmu.edu", blood_type:"B+", weight: 68, gender: "Male",  
region:"Al Dafna", password:"Default123", 
password_confirmation:"Default123", admin:false, authenticated:true) 

Donor.create!(first_name:"Selma", last_name:"Mansar", date_of_birth:41.years.ago, phone:"44548650", 
email:"selmal@andrew.cmu.edu", blood_type:"O-", weight: 76, gender: "Female",  
region:"Al Mamoura", password:"Default123", 
password_confirmation:"Default123", admin:false, authenticated:true) 

