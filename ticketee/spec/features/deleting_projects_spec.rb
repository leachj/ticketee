require "rails_helper"

RSpec.feature "users can delete projects" do
  
  before do
    @project = FactoryGirl.create(:project, name: "Sublime text 3")
    
  end
  
  scenario "successfully" do
    
    visit "/"
    click_link "Sublime text 3"
    click_link "Delete Project"
    
    expect(page.current_url).to eq projects_url
    expect(page).to have_content "Project has been deleted"
    expect(page).to have_no_content "Sublime text 3"
  end
  
  
end