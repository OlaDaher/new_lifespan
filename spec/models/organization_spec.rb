require 'spec_helper'
require 'factory_girl'

describe Organization do
  before(:each) do
    @attr = { :name => "Hamad Medical Corporation",
              :region => "Al Saad ",
              :phone => "+97444223654"
    }
  end
  
  describe "Validating fields" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:region)}
    it {should validate_presence_of(:phone)}
  end
  
  describe "Creating three owners" do
  	before (:each) do
  		@Hamad = FactoryGirl.create(:organization)
  		@Alahli = FactoryGirl.create(:organization, :name => "Alahli", :region => "Wadi Al Sail")
  		@Doha = FactoryGirl.create(:organization, :name => "Doha Clinic", :region =>"Al Naser", :phone => "+97422996432")
  	end
  	it "Create the factory object correctly" do
  		@Hamad.should be_valid
  		@Alahli.should be_valid
  		@Doha.should be_valid
  	end
  	it "should have the right attributes" do
		  @Hamad.name.should == "Hamad Medical Corporation"
		  @Hamad.region.should == "Al Saad"
	  	@Alahli.name.should == "Alahli"
	  	@Alahli.region.should == "Wadi Al Sail"
	  	@Doha.name.should == "Doha Clinic"
	  	@Doha.region.should == "Al Naser"
	  	@Doha.phone.should == "97422996432"
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
  
end
