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

require 'rails_helper'

RSpec.describe Dice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
