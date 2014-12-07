require 'rails_helper'

RSpec.describe "providers/edit", :type => :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!(
      :company_name => "MyString",
      :contact_first_name => "MyString",
      :last_name => "MyString",
      :company_phone_number => "MyString",
      :company_street_address => "MyString",
      :company_city => "MyString",
      :company_state => "MyString",
      :company_zip => 1,
      :company_email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString"
    ))
  end

  it "renders the edit provider form" do
    render

    assert_select "form[action=?][method=?]", provider_path(@provider), "post" do

      assert_select "input#provider_company_name[name=?]", "provider[company_name]"

      assert_select "input#provider_contact_first_name[name=?]", "provider[contact_first_name]"

      assert_select "input#provider_last_name[name=?]", "provider[last_name]"

      assert_select "input#provider_company_phone_number[name=?]", "provider[company_phone_number]"

      assert_select "input#provider_company_street_address[name=?]", "provider[company_street_address]"

      assert_select "input#provider_company_city[name=?]", "provider[company_city]"

      assert_select "input#provider_company_state[name=?]", "provider[company_state]"

      assert_select "input#provider_company_zip[name=?]", "provider[company_zip]"

      assert_select "input#provider_company_email[name=?]", "provider[company_email]"

      assert_select "input#provider_password[name=?]", "provider[password]"

      assert_select "input#provider_password_confirmation[name=?]", "provider[password_confirmation]"
    end
  end
end
