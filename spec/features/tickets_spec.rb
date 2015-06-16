require 'rails_helper'

describe "Board tickets" do
  it "can add a new ticket to board" do
    board = Board.create(title: "my project")
    visit board_path(board)
    click_link_or_button("New Ticket")
    fill_in("ticket[title]", with: "styles")
    fill_in("ticket[description]", with: "are needed")
    fill_in("ticket[status]", with: 2)
    click_link_or_button "Submit"
    expect(page).to have_content("styles")
    expect(board.tickets.count).to eq(1)
  end
end
