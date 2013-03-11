require 'spec_helper'

describe "medics/index" do
  before(:each) do
    assign(:medics, [
      stub_model(Medic,
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :organization_id => 1,
        :staff => false,
        :email => "Email",
        :password_digest => "Password Digest"
      ),
      stub_model(Medic,
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :organization_id => 1,
        :staff => false,
        :email => "Email",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of medics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
