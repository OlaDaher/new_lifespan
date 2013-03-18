require 'spec_helper'

describe Donor do
  before(:each) do
    @attr = {
      :active => true,
      :donor => true,
      :blood_type => "A+",
      :email => "donor@gmail.com",
      :first_name => "Donor",
      :last_name => "Donor",
      :password => "123456",
      :password_confirmation => "123456",
      :phone => "44882054",
      :region => "Al Dafnna",
      :social_network => "Twitter"
    }
  end
  
  describe "Testing the presence of all required attributes" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:password_confirmation)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:blood_type)}
    it {should validate_presence_of(:region)}
  end
  
  describe "Validating email" do
    describe "Validate good email" do
      it {should allow_value("email@aliya.com").for(:email)}
      it {should allow_value("email@aliya123.gov").for(:email)}
      it {should allow_value("email-hashim-11@aliya.com").for(:email)}
      it {should allow_value("a1990@email.org").for(:email)}
    end
    describe "Reject bad email" do
      it {should_not allow_value("email.fred.edu").for(:email)}
      it {should_not allow_value("email.com").for(:email)}
      it {should_not allow_value("655437.fred.org").for(:email)}
      it {should_not allow_value("email,hashim@fred.com").for(:email)}
      it {should_not allow_value("email,com").for(:email)}
      it {should_not allow_value("fred").for(:email)}
      it {should_not allow_value("fred@fred,com").for(:email)}
      it {should_not allow_value("fred@fred.uk").for(:email)}
      it {should_not allow_value("email hashim@fred.com").for(:email)}
      it {should_not allow_value("fred.fred.com").for(:email)}
    end
  end
  
  describe "Validating phone" do
    describe "Validate good phone number" do
      it {should allow_value("97497449744").for(:phone)}
      it {should allow_value("974-9744-9744").for(:phone)}
      it {should allow_value("974-97449744").for(:phone)}
      it {should allow_value("97449744").for(:phone)}
      it {should allow_value("9744-9744").for(:phone)}
    end
    describe "Reject bad phone number" do
      it {should_not allow_value("+(974)97449744").for(:phone)}
      it {should_not allow_value("+(974)974-497-44").for(:phone)}
      it {should_not allow_value("9744").for(:phone)}
      it {should_not allow_value("9744qatar").for(:phone)}
      it {should_not allow_value("974-qatar-974").for(:phone)}
      it {should_not allow_value("(974)4").for(:phone)}
    end
  end
  
  describe "Valiodating region" do  
    describe "Validate correct region"do
  	  it {should allow_value("Al Assiry").for(:region)}
  	  it {should allow_value("Al Bidda").for(:region)}
  	  it {should allow_value("Al Dafna").for(:region)}
  	  it {should allow_value("Al Hilal").for(:region)}
  	  it {should allow_value("Al Mamoura").for(:region)}
  	  it {should allow_value("Al Markhiya").for(:region)}
  	  it {should allow_value("Al Nasr").for(:region)}
  	  it {should allow_value("Al Sadd").for(:region)}
  	  it {should allow_value("Al Waab").for(:region)}
  	  it {should allow_value("Bin Mahmoud").for(:region)}
  	  it {should allow_value("Madinat Khalifa").for(:region)}
  	  it {should allow_value("Old Airport").for(:region)}
  	  it {should allow_value("Onaiza").for(:region)}
  	  it {should allow_value("Qutaifiya").for(:region)}
  	  it {should allow_value("Ras Abu Aboud").for(:region)}
  	  it {should allow_value("Rumeilah").for(:region)}
  	  it {should allow_value("Wadi Al Sail").for(:region)}
  	  it {should allow_value("West Bay").for(:region)}
  	  it {should allow_value("Al Wakra").for(:region)}  
    end

    # describe "Reject wrong region"do
    #       it {should_not allow_value("UK").for(:region)}
    #       it {should_not allow_value("USA").for(:region)}
    # end
  end
  
  describe "Creating three donors" do
  	before (:each) do
  		@donor1 = FactoryGirl.create(:donor)
  		@donor2 = FactoryGirl.create(:donor, :last_name => "Daniel", :active => false, :social_network => "Facebook", :email => "hjg@hotmail.com")
  		@donor3 = FactoryGirl.create(:donor, :first_name => "Srinjoy", :donor => false, :email => "lkh@hotmail.com", :blood_type => "O-")
  		@donor4 = FactoryGirl.create(:donor, :first_name => "Aliya", :region => "Al Nasr", :email => "wer@hotmail.com", :phone => "974-2244-6543")
  		@donor5 = FactoryGirl.create(:donor, :first_name => "Ola", :region => "Al Nasr", :blood_type => "O-", :email => "mnbvcxz@hotmail.com")
  	end
      it "Create the factory object correctly" do
		    @donor1.should be_valid
		    @donor2.should be_valid
		    @donor3.should be_valid
		    @donor4.should be_valid
		    @donor5.should be_valid
	    end
	    
	    it "should have the right attributes" do
  		  @donor1.first_name.should == "Donor"
  		  @donor2.last_name.should == "Daniel"
  	  	@donor3.blood_type.should == "O-"
  	  	@donor5.blood_type.should == "O-"
  	  	@donor4.email.should == "wer@hotmail.com"
    		@donor1.region.should == "Al Dafnna"
    		@donor4.region.should == "Al Nasr"
    		@donor3.social_network.should == "Twitter"
  	  	@donor2.social_network.should == "Facebook"

  	  	@donor1.active.should be_true
  	  	@donor2.active.should be_false
  	  	@donor3.active.should be_true
    		@donor4.active.should be_true
  	  end
  	  it "should remove all + and . from phone before save" do
    		@donor1.phone.should == "97444882054"
    		@donor4.phone.should == "97422446543"
    	end
    	it "should return the proper name as first_name last_name" do
    		@donor1.proper_name == "Donor Donor"
    		@donor2.proper_name == "Donor Daniel"
    		@donor3.proper_name == "Srinjoy Donor"
    		@donor4.proper_name == "Aliya Donor"
    		@donor5.proper_name == "Ola Donor"
    	end
    	it "should return the name as last_name, first_name" do
    		@donor1.name.should == "Donor, Donor"
    		@donor2.name.should == "Daniel, Donor"
    		@donor3.name.should == "Donor, Srinjoy"
    		@donor4.name.should == "Donor, Aliya"
    		@donor5.name.should == "Donor, Ola"
    	end
      # it "should return the names in alphabetical order" do
      #   Donor.alphabetical.map{|o| o.email}.should == ["donor@gmail.com", "hjg@hotmail.com", "lkh@hotmail.com", "mnbvcxz@hotmail.com", "wer@hotmail.com"]
      # end
      # it "should return only active owners" do
      #   Donor.active.alphabetical.map{|o| o.first_name}.should == ["Donor", "Srinjoy", "Aliya", "Ola"]
      # end
      # it "should return only the email" do
      #   Donor.user_email.map{|o| o.email}.should == ["Donor", "Srinjoy", "Aliya", "Ola"]
      # end
    end
	
end
