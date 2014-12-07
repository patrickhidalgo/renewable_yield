require 'rails_helper'

RSpec.describe "investments/new", :type => :view do
  before(:each) do
    assign(:investment, Investment.new(
      :term => 1,
      :interest_rate => "9.99",
      :minimum_order => 1,
      :denomination => 1
    ))
  end

  it "renders new investment form" do
    render

    assert_select "form[action=?][method=?]", investments_path, "post" do

      assert_select "input#investment_term[name=?]", "investment[term]"

      assert_select "input#investment_interest_rate[name=?]", "investment[interest_rate]"

      assert_select "input#investment_minimum_order[name=?]", "investment[minimum_order]"

      assert_select "input#investment_denomination[name=?]", "investment[denomination]"
    end
  end
end
