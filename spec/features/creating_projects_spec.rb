require 'rails_helper'
require 'bigdecimal'

feature 'Project Management' do
  scenario 'user can create an project' do
    visit new_project_path

    fill_in 'Format', with: 'json'
    fill_in 'Api key', with: 'asdkjhadu'
    fill_in 'System capacity', with: '4'
    fill_in 'Module type', with: '0'
    fill_in 'Losses', with: '0'
    fill_in 'Array type', with: '1'
    fill_in 'Tilt', with: '10'
    fill_in 'Azimuth', with: '200'
    fill_in 'Address', with: '5906 West Roxbury Place, Littleton, CO  80128'
    fill_in 'Lat', with: '0'
    fill_in 'Lon', with: '0'
    # fill_in 'File id', with: '2015-2-10'
    fill_in 'Dataset', with: 'tmy3'
    fill_in 'Radius', with: '100'
    fill_in 'Timeframe', with: 'monthly'
    fill_in 'Dc ac ratio', with: '1.1'
    fill_in 'Gcr', with: '0.4'
    fill_in 'Inv eff', with: '96'
    fill_in 'Callback', with: '2015-2-10'
    fill_in 'Npv', with: '2000'
    fill_in 'Irr', with: '8'
    fill_in 'Project score', with: '45'
    fill_in 'Status', with: 'Not Funded'

    click_button 'Create Project'
    expect(page).to have_text('4.0 Kw project was successfully created')

  end

  scenario 'user edits a project' do
    project = FactoryGirl.create(:project)
    visit edit_project_path(project)

    fill_in 'System capacity', with: '5'

    click_button 'Update'
# save_and_open_page
    expect(page).to have_text("5.0 Kw project was successfully updated.")
    # expect(page).to_not have_text("#{project.system_capacity}")
  end

  scenario 'user views an existing project' do
    project = FactoryGirl.create(:project)
    visit project_path(project)

    expect(page).to have_text(project.format)
    expect(page).to have_text(project.api_key)
    expect(page).to have_text(project.system_capacity)
    expect(page).to have_text(project.module_type)
    expect(page).to have_text(project.losses)
    expect(page).to have_text(project.array_type)
    expect(page).to have_text(project.tilt)
    expect(page).to have_text(project.azimuth)
    expect(page).to have_text(project.address)
    expect(page).to have_text(project.lat.round(12))
    expect(page).to have_text(project.lon.round(12))
    expect(page).to have_text(project.file_id)
    expect(page).to have_text(project.dataset)
    expect(page).to have_text(project.radius)
    expect(page).to have_text(project.timeframe)
    expect(page).to have_text(project.dc_ac_ratio)
    expect(page).to have_text(project.gcr)
    expect(page).to have_text(project.inv_eff)
    expect(page).to have_text(project.callback)
    expect(page).to have_text(project.npv)
    expect(page).to have_text(project.irr)
    expect(page).to have_text(project.project_score)
    expect(page).to have_text(project.status)
  end

  scenario 'user views a list of projects' do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    visit projects_path

    expect(page).to have_text(project1.format)
    expect(page).to have_text(project1.api_key)
    expect(page).to have_text(project1.system_capacity)
    expect(page).to have_text(project1.module_type)
    expect(page).to have_text(project1.losses)
    expect(page).to have_text(project1.array_type)
    expect(page).to have_text(project1.tilt)
    expect(page).to have_text(project1.azimuth)
    expect(page).to have_text(project1.address)
    expect(page).to have_text(project1.lat.round(12))
    expect(page).to have_text(project1.lon.round(12))
    expect(page).to have_text(project1.file_id)
    expect(page).to have_text(project1.dataset)
    expect(page).to have_text(project1.radius)
    expect(page).to have_text(project1.timeframe)
    expect(page).to have_text(project1.dc_ac_ratio)
    expect(page).to have_text(project1.gcr)
    expect(page).to have_text(project1.inv_eff)
    expect(page).to have_text(project1.callback)
    expect(page).to have_text(project1.npv)
    expect(page).to have_text(project1.irr)
    expect(page).to have_text(project1.project_score)
    expect(page).to have_text(project1.status)

    expect(page).to have_text(project2.format)
    expect(page).to have_text(project2.api_key)
    expect(page).to have_text(project2.system_capacity)
    expect(page).to have_text(project2.module_type)
    expect(page).to have_text(project2.losses)
    expect(page).to have_text(project2.array_type)
    expect(page).to have_text(project2.tilt)
    expect(page).to have_text(project2.azimuth)
    expect(page).to have_text(project2.address)
    expect(page).to have_text(project2.lat.round(12))
    expect(page).to have_text(project2.lon.round(12))
    expect(page).to have_text(project2.file_id)
    expect(page).to have_text(project2.dataset)
    expect(page).to have_text(project2.radius)
    expect(page).to have_text(project2.timeframe)
    expect(page).to have_text(project2.dc_ac_ratio)
    expect(page).to have_text(project2.gcr)
    expect(page).to have_text(project2.inv_eff)
    expect(page).to have_text(project2.callback)
    expect(page).to have_text(project2.npv)
    expect(page).to have_text(project2.irr)
    expect(page).to have_text(project2.project_score)
    expect(page).to have_text(project2.status)
  end
  scenario 'user can delete a project' do
    project = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)

    visit projects_path
    # save_and_open_page
    within "#project_#{project.id}" do
      click_link 'Destroy'
    end

    expect(page).to have_content('Project was successfully destroyed.')

    expect(page).to_not have_text(project.api_key)
    expect(page).to_not have_text(project.address)
    expect(page).to_not have_text(project.lat.round(12))
    expect(page).to_not have_text(project.lon.round(12))
  end
end
