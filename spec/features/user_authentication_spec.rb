require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows an user to sign up' do
    visit '/'
    expect(page).to have_link('Signup')

    click_link('Signup')

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

    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')
  end

  scenario 'allows existing Users to login' do
    user = FactoryGirl.create(:user)
    visit '/'

    expect(page).to have_link('Login')

    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titlecase}")
    expect(page).to have_text("Signed in as #{user.email}")
  end

  scenario 'does not allow existing Users to login with an invalid password' do
    user = FactoryGirl.create(:user, password: 'sup3rs3crit')
    visit '/'

    expect(page).to have_link('Login')

    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'NOT YOUR PASSWORD'

    click_button 'Login'

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'allows a logged on User to logout' do
    user = FactoryGirl.create(:user, password: 'sup3rs3crit')
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    visit '/'

    expect(page).to have_text("Signed in as #{user.email}")
    expect(page).to have_link('Logout')

    click_link 'Logout'

    expect(page).to have_text("#{user.email} has been logged out.")
    expect(page).to_not have_text("Welcome back #{user.first_name.titlecase}")
    expect(page).to_not have_text("Signed in as #{user.email}")
  end

  scenario 'allow a logged in user to claim an investment' do
    @user = FactoryGirl.create(:user)
    @investment1 = FactoryGirl.create(:investment)
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    within("#investment_#{@investment1.id}") do
      click_link 'Invest'
    end

    expect(page).to have_text("#{@investment1.term} #{@investment1.interest_rate} has been moved to your inventory.")
    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to have_selector("#investment_#{@investment2.id}")

    expect(page).to have_link('My Investments')
    click_link 'My Investments'

    expect(page).to have_selector("#investment_#{@investment1.id}")
    expect(page).to_not have_selector("#investment_#{@investment2.id}")
  end

  scenario 'allow a logged in user to un-claim an investment' do
    @user = FactoryGirl.create(:user)
    @investment1 = FactoryGirl.create(:investment)
    @user.investments << @investment1
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to have_selector("#investment_#{@investment2.id}")

    expect(page).to have_link('My Investments')
    click_link 'My Investments'

    expect(page).to have_selector("#investment_#{@investment1.id}")
    expect(page).to_not have_selector("#investment_#{@investment2.id}")

    within("#investment_#{@investment1.id}") do
      click_link 'Divest'
    end

    expect(page).to have_selector("#investment_#{@investment1.id}")
    expect(page).to have_selector("#investment_#{@investment2.id}")
    expect(page).to have_text("#{@investment1.term} #{@investment1.interest_rate} has been sold!")

    click_link 'My Investments'

    expect(page).to_not have_selector("#investment_#{@investment1.id}")

  end
end
