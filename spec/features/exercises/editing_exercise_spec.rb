require "rails_helper"

RSpec.feature "Editing Exercise" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    
    
    @e1 = @john.exercises.create(duration_in_min: 20, 
                                workout: "My body building activity",
                                workout_date: Date.today)

    login_as(@john)
  end

  scenario "with valid data succeeds" do
    visit '/'

    click_link "My Lounge"

    path = "/users/#{@john.id}/exercise/#{@e1.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(20)
  end
end