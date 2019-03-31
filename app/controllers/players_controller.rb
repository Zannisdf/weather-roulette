class PlayersController < ApplicationController
  before_action :set_player, only: %i[edit update destroy]

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

  def edit
    respond_to :js
  end

  def update
    if @player.update(player_params)
      respond_to :js
    else
      redirect_to players_path, alert: 'Please try again.'
    end
  end

  def destroy
    @player.destroy
    respond_to :js
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :wallet)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
