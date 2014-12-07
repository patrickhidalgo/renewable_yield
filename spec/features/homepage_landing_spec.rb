require 'rails_helper'

feature 'Landing on homepage' do
  scenario 'should display landing data' do
    visit '/'
    expect(page).to have_content("Renewable Yield")
    expect(page).to have_link("GET INVESTED")
    expect(page).to have_link("GET FUNDED")
    expect(page).to have_link("About")
  end
end
