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

    # expect(page).to have_text('Thank you for signing up Bob')
    # expect(page).to have_text('Signed in as Bob Smith')
  end

  scenario 'allows existing investors to login' do
    investor = FactoryGirl.create(:investor)
    visit investments_path

    expect(page).to have_link('Investor Login')

    click_link 'Investor Login'

    fill_in 'Email', with: investor.email
    fill_in 'Password', with: investor.password

    click_button 'Investor Login'

    # expect(page).to have_text("Welcome back #{investor.first_name.titlecase}")
    # expect(page).to have_text("Signed in as #{investor.email}")
  end

  scenario 'does not allow existing investors to login with an invalid password' do
    investor = FactoryGirl.create(:investor, password: 'sup3rs3crit')
    visit investments_path

    expect(page).to have_link('Investor Login')

    click_link 'Investor Login'

    fill_in 'Email', with: investor.email
    fill_in 'Password', with: 'NOT YOUR PASSWORD'

    click_button 'Investor Login'

    # expect(page).to have_text('Invalid email or password')
  end

  scenario 'allows a logged on investor to logout' do
    investor = FactoryGirl.create(:investor, password: 'sup3rs3crit')
    visit investor_login_path

    fill_in 'Email', with: investor.email
    fill_in 'Password', with: investor.password

    click_button 'Investor Login'

    visit '/'

    expect(page).to have_text("Signed in as #{investor.email}")
    expect(page).to have_link('Investor Logout')

    click_link 'Investor Logout'

    # expect(page).to have_text("#{investor.email} has logged out.")
    expect(page).to_not have_text("Welcome back #{investor.first_name.titlecase}")
    expect(page).to_not have_text("Signed in as #{investor.email}")
  end
end
