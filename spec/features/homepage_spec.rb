require 'rails_helper'

describe "Homepage" do
  it "shows a list of existing boards" do
    board = Board.create(title: "my project")
    board2 = Board.create(title: "my other project")
    visit root_path
    expect(page).to have_content(board.title)
    expect(page).to have_content(board2.title)
  end

  it "has link for each board's show page" do
    board = Board.create(title: "my project")
    visit root_path
    click_link_or_button(board.title)
    expect(page).to have_content("backlog")
    expect(page).to have_content("current sprint")
    expect(page).to have_content("in progress")
    expect(page).to have_content("done")
  end
end
