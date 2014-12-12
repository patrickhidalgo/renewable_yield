require 'rails_helper'

feature 'Project Associations' do
  scenario 'allow a logged in user to submit a project' do
    @user = FactoryGirl.create(:user)
    @project1 = FactoryGirl.create(:project)
    @project2 = FactoryGirl.create(:project)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    within("#project_#{@project1.id}") do
      click_link 'Submit'
    end

    expect(page).to have_text("#{@project1.term} #{@project1.interest_rate} has been moved to your inventory.")
    expect(page).to_not have_selector("#project_#{@project1.id}")
    expect(page).to have_selector("#project_#{@project2.id}")

    expect(page).to have_link('My Projects')
    click_link 'My Projects'

    expect(page).to have_selector("#project_#{@project1.id}")
    expect(page).to_not have_selector("#project_#{@project2.id}")
  end

  scenario 'allow a logged in user to withdraw a project' do
    @user = FactoryGirl.create(:user)
    @project1 = FactoryGirl.create(:project)
    @user.projects << @project1
    @project2 = FactoryGirl.create(:project)

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    expect(page).to_not have_selector("#project_#{@project1.id}")
    expect(page).to have_selector("#project_#{@project2.id}")

    expect(page).to have_link('My projects')
    click_link 'My projects'

    expect(page).to have_selector("#project_#{@project1.id}")
    expect(page).to_not have_selector("#project_#{@project2.id}")

    within("#project_#{@project1.id}") do
      click_link 'Withdraw'
    end

    expect(page).to have_selector("#project_#{@project1.id}")
    expect(page).to have_selector("#project_#{@project2.id}")
    expect(page).to have_text("#{@project1.term} #{@project1.interest_rate} has been sold!")

    click_link 'My Projects'

    expect(page).to_not have_selector("#project_#{@project1.id}")

  end
end
