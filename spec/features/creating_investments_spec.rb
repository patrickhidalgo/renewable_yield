require 'rails_helper'

feature 'Investment Management' do
  scenario 'user can create an investment' do
    visit new_investment_path

    fill_in 'Term', with: '6'
    fill_in 'Interest rate', with: '4.50'
    fill_in 'Minimum order', with: '1000'
    fill_in 'Denomination', with: '1000'
    fill_in 'Maturity date', with: '2020-12-10'
    fill_in 'Issue date', with: '2014-12-10'
    fill_in 'Offer start period', with: '2014-12-10'
    fill_in 'Offer end period', with: '2015-2-10'

    click_button 'Create Investment'
    # save_and_open_page
    expect(page).to have_text('6 year 4.5% rate was successfully created')

  end

  scenario 'user edits an investment' do
    investment = FactoryGirl.create(:investment)
    visit edit_investment_path(investment)

    fill_in 'Term', with: '7'

    click_button 'Update'

    expect(page).to have_text("#{investment.term} year #{investment.interest_rate}% rate was successfully updated.")
    expect(page).to have_text('7')
  end

  scenario 'user views an existing investment' do
    investment = FactoryGirl.create(:investment)
    visit investment_path(investment)

    expect(page).to have_text(investment.term)
    expect(page).to have_text(investment.interest_rate)
    expect(page).to have_text(investment.minimum_order)
    expect(page).to have_text(investment.denomination)
    expect(page).to have_text(investment.maturity_date)
    expect(page).to have_text(investment.issue_date)
    expect(page).to have_text(investment.offer_start_period)
    expect(page).to have_text(investment.offer_end_period)
  end

  scenario 'user views a list of investments' do
    investment1 = FactoryGirl.create(:investment)
    investment2 = FactoryGirl.create(:investment)
    visit investments_path

    expect(page).to have_text(investment1.term)
    expect(page).to have_text(investment1.interest_rate)
    expect(page).to have_text(investment1.minimum_order)
    expect(page).to have_text(investment1.denomination)
    expect(page).to have_text(investment1.maturity_date)
    expect(page).to have_text(investment1.issue_date)
    expect(page).to have_text(investment1.offer_start_period)
    expect(page).to have_text(investment1.offer_end_period)

    expect(page).to have_text(investment2.term)
    expect(page).to have_text(investment2.interest_rate)
    expect(page).to have_text(investment2.minimum_order)
    expect(page).to have_text(investment2.denomination)
    expect(page).to have_text(investment2.maturity_date)
    expect(page).to have_text(investment2.issue_date)
    expect(page).to have_text(investment2.offer_start_period)
    expect(page).to have_text(investment2.offer_end_period)
  end
  scenario 'user can delete an investment' do
    investment = FactoryGirl.create(:investment)
    investment2 = FactoryGirl.create(:investment)

    visit investments_path
    within "#investment_#{investment.id}" do
      click_link 'Destroy'
    end
    # save_and_open_page
    expect(page).to have_content('Investment was successfully destroyed.')

    # expect(page).to_not have_text(investment.term)
    # expect(page).to_not have_text(investment.interest_rate)
    # expect(page).to_not have_text(investment.minimum_order)
    # expect(page).to_not have_text(investment.denomination)
    # expect(page).to_not have_text(investment.maturity_date)
    # expect(page).to_not have_text(investment.issue_date)
    # expect(page).to_not have_text(investment.offer_start_period)
    # expect(page).to_not have_text(investment.offer_end_period)

  end
end
