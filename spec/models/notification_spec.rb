require 'rails_helper'

RSpec.describe Notification, type: :model do
  subject { create(:notification, player: create(:player)) }

  it { is_expected.to validate_presence_of(:message) }

end
