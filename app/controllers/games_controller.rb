class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    begin
      @game = Game.find params[:id]
    rescue ActiveRecord::RecordNotFound => error
      redirect_to "/", flash: {alert: "numero de partie de jeux "+params[:id].to_s+" introuvable"}
    end
  end
end
