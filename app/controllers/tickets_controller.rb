class TicketsController < ApplicationController
  before_action :current_board

  def new
  end

  def create
    title = params[:ticket][:title]
    description = params[:ticket][:description]
    status = params[:ticket][:status]
    ticket = current_board.tickets.new(title: title,description: description, status: status.to_i)
    # ticket = Ticket.new(ticket_params)
    if ticket.save
      redirect_to board_path(current_board)
    else
      flash[:error] = "something went wrong"
      redirect_to board_path(current_board)
    end
  end

  def update
    ticket = Ticket.find_by(id: params[:id])
    status = params[:status]
    status_number = Ticket.statuses[status].to_i + 1
    ticket.update_attributes(status: status_number)
    redirect_to board_path(current_board)
  end

  def current_board
    @board = Board.find_by(id: params[:board_id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end

end
