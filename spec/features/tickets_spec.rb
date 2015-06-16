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

  it "can change status of ticket from backlog to sprint" do
    board = Board.create(title: "my project")
    ticket = board.tickets.create(title: "first ticket", description:"", status:0)
    visit board_path(board)
    click_link_or_button("Move to Sprint")
    within("#current-sprint") do
      expect(page).to have_content(ticket.title)
    end
  end

  it "can change status of ticket from sprint to in-progress" do
    board = Board.create(title: "my project")
    ticket = board.tickets.create(title: "first ticket", description:"", status:1)
    visit board_path(board)
    click_link_or_button("Move to In Progress")
    within("#in-progress") do
      expect(page).to have_content(ticket.title)
    end
  end
end
