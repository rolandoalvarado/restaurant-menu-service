require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { create(:dish) }

  it 'has a valid factory' do
    expect(build(:dish)).to be_valid
  end

  describe 'validations' do
    context 'model dependencies' do
      it { should have_many(:menu_items).dependent(:destroy) }
    end

    context 'presence' do
      it { should validate_presence_of(:name) }
    end
  end
end
