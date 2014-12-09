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

  scenario 'user can delete an investment' do
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
    visit '/investments'
    click_link 'Destroy'
    # save_and_open_page

    # expect(page).to have_text('6 year 4.5% rate was successfully deleted.')

    # expect(page).to_not have_text('6')
    # expect(page).to_not have_text('4.5')
    # expect(page).to_not have_text('2020-12-10')
    # expect(page).to_not have_text('2015-2-10')

  end

end
