# == Schema Information
#
# Table name: fruits
#
#  id         :integer          not null, primary key
#  color      :string
#  croped_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  orchard_id :integer
#

require 'rails_helper'

RSpec.describe Fruit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
