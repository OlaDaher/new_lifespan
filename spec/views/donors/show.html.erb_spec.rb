require 'spec_helper'

describe "donors/show" do
  before(:each) do
    @donor = assign(:donor, stub_model(Donor,
      :first_name => "First Name",
      :last_name => "Last Name",
      :phone => "Phone",
      :region => "Region",
      :active => false,
      :blood_type => "Blood Type",
      :admin => false,
      :social_network => "Social Network",
      :email => "Email",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Region/)
    rendered.should match(/false/)
    rendered.should match(/Blood Type/)
    rendered.should match(/false/)
    rendered.should match(/Social Network/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
  end
end
