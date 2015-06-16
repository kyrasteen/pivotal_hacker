require "rails_helper"

describe "New Board" do
  it "can create a new board from the root" do
    visit root_path
    click_link_or_button "Make New Board"
    fill_in("board[title]", with: "my project")
    click_link_or_button "Create"
    expect(page).to have_content("my project")
  end
end
