# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  COLORS = [:red, :yellow, :blue, :green]
  has_one :orchard
  has_one :dice
  has_one :crow
  has_many :fruits, through: :orchard
  has_and_belongs_to_many :users

  before_create :setup_game

  scope :of_user, ->(user){
    return user.games unless user.nil?
    Game.all  # test line
  }
  
  # def self.of_user user    
  #   return user.games unless user.nil?
  #   Game.all  # test line
  # end

  # return Game::ActiveRecord_Relation
  # give games created at within last 7 days

  # (->(x=5){puts x}).call

  scope :recent, ->(){
    # start_range = 1.week.ago
    # stop_range = Time.now    
    stop_range = self.last.created_at    
    start_range = stop_range - 7.days
    self.where(created_at: [start_range..stop_range]).limit 25
  }  

  def self.second_page
    self.offset 25
  end
  
  def win
    self.status = :win
    self.finished_at = DateTime.now
  end

  def loose
    self.status = :loose
    self.finished_at = DateTime.now
  end

  # private

  def status
    "Crow advancement is #{crow.advancement}/6
    There are #{fruits.on_tree.count} fruits left in orchard."
  end

  def roll_dice
    dice.roll
    case dice.showing_face
    when :crow
      crow.step
    when :basket
      orchard.pick_fruit
    else
      color = dice.showing_face
      orchard.pick_fruit color
    end
  end

  def setup_game
    self.orchard ||= Orchard.new
    self.dice ||= Dice.new
    self.crow ||= Crow.new
  end
end
