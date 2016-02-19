require 'rails_helper'

RSpec.feature "User can create new projects" do
  scenario "with valid arrtibutes" do
    visit "/"
    
    click_link "New Project"
    
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor"
    click_button "Create Project"
    
    expect(page).to have_content "Project has been created"
    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project)
    expect(page).to have_title "Projects - Ticketee"
  end
end