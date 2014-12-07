require 'rails_helper'

RSpec.describe "providers/show", :type => :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Contact First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Company Phone Number/)
    expect(rendered).to match(/Company Street Address/)
    expect(rendered).to match(/Company City/)
    expect(rendered).to match(/Company State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Company Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Password Confirmation/)
  end
end
