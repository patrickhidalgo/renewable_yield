# require 'rails_helper'
#
# feature 'Project Management' do
#   scenario 'user can create an project' do
#     visit new_project_path
#
#     fill_in 'Term', with: '6'
#     fill_in 'Interest rate', with: '4.50'
#     fill_in 'Minimum order', with: '1000'
#     fill_in 'Denomination', with: '1000'
#     fill_in 'Maturity date', with: '2020-12-10'
#     fill_in 'Issue date', with: '2014-12-10'
#     fill_in 'Offer start period', with: '2014-12-10'
#     fill_in 'Offer end period', with: '2015-2-10'
#
#     click_button 'Create Project'
#     # save_and_open_page
#     expect(page).to have_text('6 year 4.5% rate was successfully created')
#
#   end
#
#   scenario 'user edits a project' do
#     project = FactoryGirl.create(:project)
#     visit edit_project_path(project)
#
#     fill_in 'Term', with: '7'
#
#     click_button 'Update'
#
#     expect(page).to have_text("#{project.term} year #{project.interest_rate}% rate was successfully updated.")
#     expect(page).to have_text('7')
#   end
#
#   scenario 'user views an existing project' do
#     project = FactoryGirl.create(:project)
#     visit project_path(project)
#
#     expect(page).to have_text(project.term)
#     expect(page).to have_text(project.interest_rate)
#     expect(page).to have_text(project.minimum_order)
#     expect(page).to have_text(project.denomination)
#     expect(page).to have_text(project.maturity_date)
#     expect(page).to have_text(project.issue_date)
#     expect(page).to have_text(project.offer_start_period)
#     expect(page).to have_text(project.offer_end_period)
#   end
#
#   scenario 'user views a list of projects' do
#     project1 = FactoryGirl.create(:project)
#     project2 = FactoryGirl.create(:project)
#     visit projects_path
#
#     expect(page).to have_text(project1.term)
#     expect(page).to have_text(project1.interest_rate)
#     expect(page).to have_text(project1.minimum_order)
#     expect(page).to have_text(project1.denomination)
#     expect(page).to have_text(project1.maturity_date)
#     expect(page).to have_text(project1.issue_date)
#     expect(page).to have_text(project1.offer_start_period)
#     expect(page).to have_text(project1.offer_end_period)
#
#     expect(page).to have_text(project2.term)
#     expect(page).to have_text(project2.interest_rate)
#     expect(page).to have_text(project2.minimum_order)
#     expect(page).to have_text(project2.denomination)
#     expect(page).to have_text(project2.maturity_date)
#     expect(page).to have_text(project2.issue_date)
#     expect(page).to have_text(project2.offer_start_period)
#     expect(page).to have_text(project2.offer_end_period)
#   end
#   scenario 'user can delete a project' do
#     project1 = FactoryGirl.create(:project)
#     project2 = FactoryGirl.create(:project)
#
#     visit projects_path
#     within "#project_#{project.id}" do
#       click_link 'Destroy'
#     end
#     # save_and_open_page
#     expect(page).to have_content('Project was successfully destroyed.')
#
#     # expect(page).to_not have_text(investment.term)
#     # expect(page).to_not have_text(investment.interest_rate)
#     # expect(page).to_not have_text(investment.minimum_order)
#     # expect(page).to_not have_text(investment.denomination)
#     # expect(page).to_not have_text(investment.maturity_date)
#     # expect(page).to_not have_text(investment.issue_date)
#     # expect(page).to_not have_text(investment.offer_start_period)
#     # expect(page).to_not have_text(investment.offer_end_period)
#
#   end
# end
