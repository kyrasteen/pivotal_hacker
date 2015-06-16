class BoardsController < ApplicationController
  def show
    @board = Board.find_by(id: params[:id])
  end

  def new
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to board_path(board)
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
