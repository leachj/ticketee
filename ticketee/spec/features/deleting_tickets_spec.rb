require "rails_helper"

RSpec.feature "users can delete projects" do
  
  let(:project) { FactoryGirl.create(:project)}
  let(:ticket) { FactoryGirl.create(:ticket, project: project)}
  
  before do
    visit project_ticket_path(project, ticket)
  end
  
  scenario "successfully" do
    
    click_link "Delete Ticket"
    
    expect(page.current_url).to eq project_url(project)
    expect(page).to have_content "Ticket has been deleted"
  end
  
  
end