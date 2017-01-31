# == Schema Information
#
# Table name: dices
#
#  id           :integer          not null, primary key
#  showing_face :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  game_id      :integer
#

class Dice < ApplicationRecord
  belongs_to :game

  before_create :roll

  def roll
    self.showing_face = faces.sample
  end

  private

  def faces
    Game::COLORS + [:crow, :basket]
  end

end
