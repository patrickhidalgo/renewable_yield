require 'rails_helper'

RSpec.describe "investments/index", :type => :view do
  before(:each) do
    assign(:investments, [
      Investment.create!(
        :term => 1,
        :interest_rate => "9.99",
        :minimum_order => 2,
        :denomination => 3
      ),
      Investment.create!(
        :term => 1,
        :interest_rate => "9.99",
        :minimum_order => 2,
        :denomination => 3
      )
    ])
  end

  it "renders a list of investments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
