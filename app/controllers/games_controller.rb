class GamesController < ApplicationController
  def index    
    params[:page]=params[:page]||1    
    page_offset=(params[:page].to_i - 1) * 5 
    # for making a random order before taking 5 rows
    # @games = Game.all.order("RANDOM()").offset(page_offset).limit(5)  
    current_user_games=Game.of_user(current_user)
    @games = current_user_games.recent.offset(page_offset).limit(5) unless current_user_games.nil?
    @prec_is_possible = page_offset >1
    @succ_is_possible = !current_user_games.nil? && ((page_offset + 5) < Game.of_user(current_user).recent.count)
  end

  def show
    begin
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      puts "I m starting rescue"
      redirect_to "/", flash: {alert: params[:id].to_s}
      # redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
      puts "I've finished rescue"
    end
  end

  def win
    #recherche du jeu
    game = Game.find params[:id]
    #gagner le jeu
    game.win
    game.save!
    #sauvegarder le jeu
    
    redirect_to  root_path
  end
end
