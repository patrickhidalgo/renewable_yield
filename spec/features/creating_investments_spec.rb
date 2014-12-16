require 'rails_helper'
include ActionView::Helpers::NumberHelper

feature 'Investment Management' do
  scenario 'guest user cannot create, edit or destroy an investment' do

    visit investments_path

    expect(page).to_not have_link('Edit')
    expect(page).to_not have_link('Destroy')
    expect(page).to_not have_link('New Investment')

  end

  scenario 'guest user views a list of investments' do
    investment1 = FactoryGirl.create(:investment)
    investment2 = FactoryGirl.create(:investment)
    visit investments_path

    expect(page).to have_text(investment1.term)
    expect(page).to have_text(investment1.interest_rate)
    expect(page).to have_text(number_to_currency(investment1.minimum_order, precision: 2))
    expect(page).to have_text(number_to_currency(investment1.denomination, precision: 2))
    expect(page).to have_text(investment1.maturity_date.strftime('%B %-d, %Y'))
    expect(page).to have_text(investment1.offer_end_period.strftime('%B %-d, %Y'))

    expect(page).to have_text(investment2.term)
    expect(page).to have_text(investment2.interest_rate)
    expect(page).to have_text(number_to_currency(investment2.minimum_order, precision: 2))
    expect(page).to have_text(number_to_currency(investment2.denomination, precision: 2))
    expect(page).to have_text(investment2.maturity_date.strftime('%B %-d, %Y'))
    expect(page).to have_text(investment2.offer_end_period.strftime('%B %-d, %Y'))
  end
end
