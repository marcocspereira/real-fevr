require 'rails_helper'

RSpec.describe PlayerPolicy, type: :policy do
  subject { described_class.new(user, Player) }

  let(:article) { create(:article) }

  context 'when is an admin' do
    let(:user) { create(:admin) }

    it { is_expected.to permit_action(:index) }
  end

  context 'when is a basic user' do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:index) }
  end

  context 'when is public' do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }
  end
end
