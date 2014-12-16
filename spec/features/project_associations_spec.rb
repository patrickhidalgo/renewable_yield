require 'rails_helper'

feature 'Project Associations' do
  scenario 'allow a logged in provider to create a project' do
    @user = FactoryGirl.create(:user, role: 'provider')

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'
    visit new_project_path

    fill_in 'System capacity', with: '4'
    fill_in 'Module type', with: '0'
    fill_in 'Losses', with: '40'
    fill_in 'Array type', with: '1'
    fill_in 'Tilt', with: '10'
    fill_in 'Azimuth', with: '200'
    fill_in 'Address', with: '5906 West Roxbury Place, Littleton, CO  80128'
    fill_in 'Lat', with: '40'
    fill_in 'Lon', with: '50'
    click_button 'Create Project'
    expect(page).to have_text('4.0 Kw project was successfully created')
  end

  scenario 'allow a logged in provider to destroy a project' do
    @user = FactoryGirl.create(:user, role: 'provider')
    @project1 = FactoryGirl.create(:project)
    @user.projects << @project1

    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'

    expect(page).to have_link('My Projects')
    click_link 'My Projects'
    expect(page).to have_selector("#project_#{@project1.id}")

    within("#project_#{@project1.id}") do
      click_link 'Destroy'
    end

    expect(page).to have_text("#{@project1.system_capacity} Kw project has been destroyed!")

    click_link 'My Projects'

    expect(page).to_not have_selector("#project_#{@project1.id}")

  end
end
