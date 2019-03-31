class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    respond_to :js
  end
end
