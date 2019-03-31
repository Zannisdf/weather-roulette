class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    respond_to :js
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      respond_to :js
    else
      redirect_to players_path, alert: 'Please try again.'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :wallet)
  end
end
