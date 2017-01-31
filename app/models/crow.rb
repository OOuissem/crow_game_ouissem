# == Schema Information
#
# Table name: crows
#
#  id          :integer          not null, primary key
#  advancement :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  game_id     :integer
#

class Crow < ApplicationRecord
  belongs_to :game

  validates_numericality_of :advancement, only_integer: true, less_than: 7

  def step
    self.advancement = self.advancement + 1
  end
end
