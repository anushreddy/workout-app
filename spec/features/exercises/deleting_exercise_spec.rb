require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john1@example.com", password: "password")
    
    @e1 = @john.exercises.create!(duration_in_min: 30, 
                                workout: "My body building activity",
                                workout_date: Date.today)

    login_as(@john)
  end

  scenario "with valid data succeeds" do
    visit "/"

    click_link "My Lounge"

    path = "/users/#{@john.id}/exercises/#{@e1.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
