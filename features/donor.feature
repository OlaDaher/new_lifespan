Feature: Business Goal
	As a user
	I want to be able to view certain information
	So I can use the system efficiently
	
	Scenario: Do not see the default rails
    	When I go to the home page
    	Then I should not see "You'r riding Ruby on Rails"
      	And I should not see "About your application's environment"
  		And I should not see "Create you data base"

	Scenario: View "About Us"
		Given I am in the home page
		When I follow the "How LifeSpan+ Works" link
		Then I should  see "LifeSpan+ | About Us" in the "title"

	Scenario: View "Contact Us"
		Given I am in the home page
		When I follow the "Contact" link
		Then I should  see "LifeSpan+ | Contact Us" in the "title"

	Scenario: View "Privacy Policy"
		Given I am in the home page
		When I follow the "Privacy" link
		Then I should  see "LifeSpan+ | Privacy Policy" in the "title"
		
	Scenario: Donor Information
		Given I am in a new donor page
		When I enter "Aliya" in the firstname field
		And I enter "Hashim" in the lastname field
		And I enter "97497449744" in the phone field
		And I select "Al Nasr" from regions list
		And I select "A+" from blood type list
		And I select "Facebook" from social network list
		And I enter "aliya@hotmail.com" in the email field
		And I enter "default" in the password field
		And I enter "default" in the password confirmation field
		And I check the active box
		And I click the "Create Donor" button
		Then I see "Donor was successfully created."

	Scenario: Follow Donor#new page and fill it
		Given I am in a new donor page
		When I enter "Aliya" in the firstname field
		And I enter "Hashim" in the lastname field
		And I enter "97497449744" in the phone field
		And I select "Al Nasr" from regions list
		And I select "A+" from blood type list
		And I select "Facebook" from social network list
		And I enter "aliya@hotmail.com" in the email field
		And I enter "default" in the password field
		And I enter "default" in the password confirmation field
		And I check the active box
		And I click the "Create Donor" button		
		Then I see "Donor was successfully created"

	Scenario: Medic Information
		Given I am in a new medic page
		When I enter "Aliya" in the medic firstname field
		And I enter "Hashim" in the medic lastname field
		And I select "Hamad" in the organization_id list
		And I select "Doctor" from position list
		And I enter "aliya@hotmail.com" in the medic email field
		And I enter "default" in the medic password field
		And I enter "default" in the medic password confirmation field
		And I check the staff box
		And I click the "Create Medic" button
		Then I see "Medic was successfully created."
