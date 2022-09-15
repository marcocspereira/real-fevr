require 'rails_helper'

RSpec.describe Player, type: :model do
  subject { create(:player) }

  it { is_expected.to validate_inclusion_of(:position).in_array(Player::POSITIONS) }
  it { is_expected.to validate_numericality_of(:number).is_greater_than_or_equal_to(0) }

end
