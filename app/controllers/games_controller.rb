class GamesController < ApplicationController
  def index   
    params[:page]=params[:page]||1    
    page_offset=(params[:page].to_i - 1) * 5 
    # for making a random order before taking 5 rows
    # @games = Game.all.order("RANDOM()").offset(page_offset).limit(5)  
    @games = Game.all.offset(page_offset).limit(5)
    @prec_is_possible = page_offset >1
    @succ_is_possible = (page_offset + 5) < Game.count
  end

  def show
    begin
      @game = Game.find params[:id]
    rescue ActiveRecord::RecordNotFound => error
      redirect_to "/", flash: {alert: "numero de partie de jeux "+params[:id].to_s+" introuvable"}
    end
  end
end
