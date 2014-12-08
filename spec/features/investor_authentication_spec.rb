require 'rails_helper'

feature 'Investor Authentication' do
  scenario 'allows an investor to sign up' do
    visit investments_path
    expect(page).to have_link('Investor Signup')

    click_link('Investor Signup')

    fill_in 'First name', with: 'bob'
    fill_in 'Middle name', with: 'lee'
    fill_in 'Last name', with: 'smith'
    fill_in 'Phone number', with: '3033333333'
    fill_in 'Street address', with: '123 anywhere street'
    fill_in 'City', with: 'anytown'
    fill_in 'State', with: 'co'
    fill_in 'Zip', with: '80202'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Ssn', with: '1234567890'
    fill_in 'Password', with: 'sup3rs3crit'
    fill_in 'Password confirmation', with: 'sup3rs3crit'

    click_button 'Investor Signup'
save_and_open_page
    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as Bob Smith')
  end
end
