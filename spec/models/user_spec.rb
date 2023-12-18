require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.confirmed' do
    it 'only returns confirmed users' do
      included = FactoryBot.create(:user, confirmed_at: Time.current)
      FactoryBot.create(:user, confirmed_at: nil)

      expect(described_class.confirmed).to eq [included]
    end
  end
end
