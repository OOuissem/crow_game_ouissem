# == Schema Information
#
# Table name: orchards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

require 'rails_helper'

RSpec.describe Orchard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
