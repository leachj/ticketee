require "rails_helper"

RSpec.feature "Users can view tickets" do
  
  let(:author) {FactoryGirl.create(:user) }
  
  before do
    sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
    FactoryGirl.create(:ticket, project: sublime, name: "make it shiny", description: "Gradients! starbursts! oh my!", author: author)
    
    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    FactoryGirl.create(:ticket, project: ie, name: "Standards compliance", description: "isnt a joke", author: author)
    
    visit "/"
  end
  
  scenario "for a given project" do
    click_link "Sublime Text 3"
    
    expect(page).to have_content "make it shiny"
    expect(page).to_not have_content "Standards compliance"
    
    click_link "make it shiny"
    within("#ticket h2") do
      expect(page).to have_content "make it shiny"
    end
    
    expect(page).to have_content "Gradients! starbursts! oh my!"
  end
end

    