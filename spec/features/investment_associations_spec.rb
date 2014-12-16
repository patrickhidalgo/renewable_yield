require 'rails_helper'
include ActionView::Helpers::NumberHelper

feature 'Investment Associations' do
  scenario 'allow a logged in investor to claim an investment' do
    @user = FactoryGirl.create(:user, role: 'investor')

    @investment1 = FactoryGirl.create(:investment)
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    visit investments_path

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

  scenario 'allow a logged in investor to un-claim an investment' do
    @user = FactoryGirl.create(:user, role: 'investor')
    @investment1 = FactoryGirl.create(:investment)
    @user.investments << @investment1
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    visit investments_path

    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to have_selector("#investment_#{@investment2.id}")

    expect(page).to have_link('My Investments')
    click_link 'My Investments'

    expect(page).to have_selector("#investment_#{@investment1.id}")
    expect(page).to_not have_selector("#investment_#{@investment2.id}")

    within("#investment_#{@investment1.id}") do
      click_link 'Divest'
    end

    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to_not have_selector("#investment_#{@investment2.id}")
    expect(page).to have_text("#{@investment1.term} #{@investment1.interest_rate} has been sold!")

    click_link 'My Investments'

    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to_not have_selector("#investment_#{@investment2.id}")
  end

  scenario 'does not allow a logged in investor to create an investment' do
    @user = FactoryGirl.create(:user, role: 'investor')

    @investment1 = FactoryGirl.create(:investment)
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    visit investments_path

    expect(page).to_not have_link('New Investment')
  end

  scenario 'allow a logged in investor to view a list of projects' do
    @user = FactoryGirl.create(:user, role: 'investor')

    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)

    visit projects_path

    expect(page).to_not have_text(project1.system_capacity)
    expect(page).to_not have_text(project1.address)
    expect(page).to_not have_text(project1.lat.round(12))
    expect(page).to_not have_text(project1.lon.round(12))
    expect(page).to_not have_text(project1.npv)
    expect(page).to_not have_text(project1.status)

    expect(page).to_not have_text(project2.system_capacity)
    expect(page).to_not have_text(project2.address)
    expect(page).to_not have_text(project2.lat.round(12))
    expect(page).to_not have_text(project2.lon.round(12))
    expect(page).to_not have_text(project2.npv)
    expect(page).to_not have_text(project2.status)
  end

  scenario 'allows a logged in admin to create an investment' do
    @user = FactoryGirl.create(:user, role: 'admin')

    @investment1 = FactoryGirl.create(:investment)
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    visit investments_path

    click_link 'New Investment'
    term = rand(1..7)
    interest_rate = 1.50 + (0.50 * term)
    fill_in 'Term', with: term
    fill_in 'Interest rate', with: interest_rate
    fill_in 'Minimum order', with: 1000
    fill_in 'Denomination', with: 1000
    fill_in 'Maturity date', with: term.years.from_now
    fill_in 'Issue date', with: Date.today
    fill_in 'Offer start period', with: Date.today
    fill_in 'Offer end period', with: 3.months.from_now

    click_button 'Create Investment'

    expect(page).to have_text("#{term} year #{interest_rate}% rate was successfully created.")
  end

  scenario 'allows a logged in admin to destroy an investment' do
    @user = FactoryGirl.create(:user, role: 'admin')

    @investment1 = FactoryGirl.create(:investment)
    @investment2 = FactoryGirl.create(:investment)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    visit investments_path
    within("#investment_#{@investment1.id}") do
      click_link 'Destroy'
    end

    expect(page).to have_text("#{@investment1.term} year #{@investment1.interest_rate} was successfully destroyed.")
    expect(page).to_not have_selector("#investment_#{@investment1.id}")
    expect(page).to have_selector("#investment_#{@investment2.id}")
  end

end
