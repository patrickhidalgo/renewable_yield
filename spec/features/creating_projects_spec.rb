require 'rails_helper'
require 'bigdecimal'

feature 'Project Management' do
  scenario 'guest user cannot create, edit or destroy a project' do
    visit projects_path

    expect(page).to_not have_link('Edit')
    expect(page).to_not have_link('Destroy')
    expect(page).to_not have_link('New Project')

  end

  scenario 'guest user cannot view a list of projects' do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)

    visit projects_path

    expect(page).to_not have_text(project1.system_capacity)
    expect(page).to_not have_text(project1.address)
    expect(page).to_not have_text(project1.lat.round(12))
    expect(page).to_not have_text(project1.lon.round(12))
    expect(page).to_not have_text(project1.npv)
    expect(page).to_not have_text(project1.project_score)
    expect(page).to_not have_text(project1.status)

    expect(page).to_not have_text(project2.system_capacity)
    expect(page).to_not have_text(project2.address)
    expect(page).to_not have_text(project2.lat.round(12))
    expect(page).to_not have_text(project2.lon.round(12))
    expect(page).to_not have_text(project2.npv)
    expect(page).to_not have_text(project2.project_score)
    expect(page).to_not have_text(project2.status)
  end

end

