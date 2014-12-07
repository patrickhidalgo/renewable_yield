require 'rails_helper'

RSpec.describe "investors/edit", :type => :view do
  before(:each) do
    @investor = assign(:investor, Investor.create!(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :phone_number => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :email => "MyString",
      :ssn => 1,
      :password => "MyString",
      :password_confirmation => "MyString"
    ))
  end

  it "renders the edit investor form" do
    render

    assert_select "form[action=?][method=?]", investor_path(@investor), "post" do

      assert_select "input#investor_first_name[name=?]", "investor[first_name]"

      assert_select "input#investor_middle_name[name=?]", "investor[middle_name]"

      assert_select "input#investor_last_name[name=?]", "investor[last_name]"

      assert_select "input#investor_phone_number[name=?]", "investor[phone_number]"

      assert_select "input#investor_street_address[name=?]", "investor[street_address]"

      assert_select "input#investor_city[name=?]", "investor[city]"

      assert_select "input#investor_state[name=?]", "investor[state]"

      assert_select "input#investor_zip[name=?]", "investor[zip]"

      assert_select "input#investor_email[name=?]", "investor[email]"

      assert_select "input#investor_ssn[name=?]", "investor[ssn]"

      assert_select "input#investor_password[name=?]", "investor[password]"

      assert_select "input#investor_password_confirmation[name=?]", "investor[password_confirmation]"
    end
  end
end
