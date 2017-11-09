require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { create(:menu) }

  it 'has a valid factory' do
    expect(build(:menu)).to be_valid
  end

  describe 'validations' do
    context 'model dependencies' do
      it { should have_many(:menu_pages).dependent(:destroy) }
    end

    context 'presence' do
      it { expect(menu).to validate_presence_of(:sponsor) }
      it { expect(menu).to validate_presence_of(:event) }
      it { expect(menu).to validate_presence_of(:venue) }
      it { expect(menu).to validate_presence_of(:place) }
    end

    context 'format' do
      it { expect(menu).to_not allow_value(nil).for(:sponsor) }
      it { expect(menu).to_not allow_value(nil).for(:event) }
      it { expect(menu).to_not allow_value(nil).for(:venue) }
      it { expect(menu).to_not allow_value(nil).for(:place) }
    end
  end
end
