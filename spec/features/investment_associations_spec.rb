require 'rails_helper'

feature 'Investment Associations' do
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
