require 'spec_helper'

describe "medics/show" do
  before(:each) do
    @medic = assign(:medic, stub_model(Medic,
      :first_name => "First Name",
      :last_name => "Last Name",
      :position => "Position",
      :organization_id => 1,
      :staff => false,
      :email => "Email",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Position/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
  end
end
