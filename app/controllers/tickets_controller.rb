class TicketsController < ApplicationController
  before_action :current_board

  def new
  end

  def create
    ticket = current_board.tickets.new(title: params[:title], description: params[:description], status: params[:status].to_i)
    if ticket.save
      redirect_to board_path(current_board)
    else
      flash[:error] = "something went wrong"
      redirect_to board_path(current_board)
    end
  end

  def current_board
    @board = Board.find_by(id: params[:board_id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end
end
