class HomepageController < ApplicationController
  def index
    @boards = Board.all
  end
end
