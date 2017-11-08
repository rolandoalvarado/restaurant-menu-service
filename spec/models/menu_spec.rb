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
      it { should validate_presence_of(:sponsor) }
      it { should validate_presence_of(:event) }
      it { should validate_presence_of(:venue) }
      it { should validate_presence_of(:place) }
    end
  end
end
