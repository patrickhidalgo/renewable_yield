require 'rails_helper'

RSpec.describe "providers/index", :type => :view do
  before(:each) do
    assign(:providers, [
      Provider.create!(
        :company_name => "Company Name",
        :contact_first_name => "Contact First Name",
        :last_name => "Last Name",
        :company_phone_number => "Company Phone Number",
        :company_street_address => "Company Street Address",
        :company_city => "Company City",
        :company_state => "Company State",
        :company_zip => 1,
        :company_email => "Company Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      ),
      Provider.create!(
        :company_name => "Company Name",
        :contact_first_name => "Contact First Name",
        :last_name => "Last Name",
        :company_phone_number => "Company Phone Number",
        :company_street_address => "Company Street Address",
        :company_city => "Company City",
        :company_state => "Company State",
        :company_zip => 1,
        :company_email => "Company Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      )
    ])
  end

  it "renders a list of providers" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Company Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "Company City".to_s, :count => 2
    assert_select "tr>td", :text => "Company State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Company Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
  end
end
