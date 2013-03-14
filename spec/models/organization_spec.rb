require 'spec_helper'
require 'factory_girl'

describe Organization do
  before(:each) do
    @attr = { :name => "Hamad Medical Corporation",
              :region => "Al Saad "
    }
  end
  
  describe "Validating fields" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:region)}
  end
  
  describe "Creating three owners" do
  	before (:each) do
  		@Hamad = FactoryGirl.create(:organization)
  		@Alahli = FactoryGirl.create(:organization, :name => "Alahli", :region => "Wadi Al Sail")
  		@Doha = FactoryGirl.create(:organization, :name => "Doha Clinic", :region =>"Al Naser")
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

	  end
  end
end
