require 'rails_helper'

RSpec.describe "investments/show", :type => :view do
  before(:each) do
    @investment = assign(:investment, Investment.create!(
      :term => 1,
      :interest_rate => "9.99",
      :minimum_order => 2,
      :denomination => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
