require "rails_helper"

RSpec.feature "Searching for Users" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
  end

  scenario "with exisiting name returns all users" do 
    visit '/'

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.fullname)
    expect(page).to have_content(@sarah.fullname)
    expect(current_path).to eq ("/dashboards/search")
  end
end