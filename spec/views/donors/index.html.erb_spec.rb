require 'spec_helper'

describe "donors/index" do
  before(:each) do
    assign(:donors, [
      stub_model(Donor,
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
      ),
      stub_model(Donor,
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
      )
    ])
  end

  it "renders a list of donors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Blood Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Social Network".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
