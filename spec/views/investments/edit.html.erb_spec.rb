require 'rails_helper'

RSpec.describe "investments/edit", :type => :view do
  before(:each) do
    @investment = assign(:investment, Investment.create!(
      :term => 1,
      :interest_rate => "9.99",
      :minimum_order => 1,
      :denomination => 1
    ))
  end

  it "renders the edit investment form" do
    render

    assert_select "form[action=?][method=?]", investment_path(@investment), "post" do

      assert_select "input#investment_term[name=?]", "investment[term]"

      assert_select "input#investment_interest_rate[name=?]", "investment[interest_rate]"

      assert_select "input#investment_minimum_order[name=?]", "investment[minimum_order]"

      assert_select "input#investment_denomination[name=?]", "investment[denomination]"
    end
  end
end
