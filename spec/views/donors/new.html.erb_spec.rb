require 'spec_helper'

describe "donors/new" do
  before(:each) do
    assign(:donor, stub_model(Donor,
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :region => "MyString",
      :active => false,
      :blood_type => "MyString",
      :admin => false,
      :social_network => "MyString",
      :email => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  it "renders new donor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", donors_path, "post" do
      assert_select "input#donor_first_name[name=?]", "donor[first_name]"
      assert_select "input#donor_last_name[name=?]", "donor[last_name]"
      assert_select "input#donor_phone[name=?]", "donor[phone]"
      assert_select "select#donor_region[name=?]", "donor[region]"
      assert_select "input#donor_active[name=?]", "donor[active]"
      assert_select "select#donor_blood_type[name=?]", "donor[blood_type]"
      assert_select "input#donor_admin[name=?]", "donor[admin]"
      assert_select "select#donor_social_network[name=?]", "donor[social_network]"
      assert_select "input#donor_email[name=?]", "donor[email]"
      assert_select "input#donor_password_digest[name=?]", "donor[password_digest]"
    end
  end
end
