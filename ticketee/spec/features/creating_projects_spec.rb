require 'rails_helper'

RSpec.feature "User can create new projects" do
  
  before do
    visit "/"
    
    click_link "New Project"
  end
  
  scenario "with valid arrtibutes" do
    
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor"
    click_button "Create Project"
    
    expect(page).to have_content "Project has been created"
    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project)
    expect(page).to have_title "Projects - Ticketee"
  end
  
  scenario "When providing invalid attributes" do
    
    click_button "Create Project"
    
    expect(page).to have_content "Project has not been created"
    expect(page).to have_content "Name can't be blank"
  end
end