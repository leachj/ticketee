require "rails_helper"

RSpec.feature "users can edit projects" do
  
  before do
    @project = FactoryGirl.create(:project, name: "Sublime text 3")
    
    visit "/"
    click_link "Sublime text 3"
    click_link "Edit Project"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime text 4"
    click_button "Update Project"
    
    expect(page.current_url).to eq project_url(@project)
    expect(page).to have_content "Project has been updated"
    expect(page).to have_content "Sublime text 4"
  end
  
  scenario "with invalid attributes" do
    
    fill_in "Name", with: ""
    click_button "Update Project"
    
    expect(page).to have_content "Project has not been updated"
    
  end
  
end