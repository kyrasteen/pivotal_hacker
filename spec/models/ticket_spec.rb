require 'rails_helper'

describe "tickets" do
  it "belongs to a board" do
    board = Board.create(title: "my project")
    ticket = board.tickets.create(title: "todo", description:"soon", status:0)
    expect(ticket.board).to eq(board)
  end
end
