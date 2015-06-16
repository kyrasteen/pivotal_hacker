class BoardsController < ApplicationController
  def show
    @board = Board.find_by(id: params[:id])
  end
end
