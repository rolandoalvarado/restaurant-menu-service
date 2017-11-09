require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { create(:dish) }

  it 'has a valid factory' do
    expect(build(:dish)).to be_valid
  end

  describe 'validations' do
    context 'model dependencies' do
      it { expect(dish).to have_many(:menu_items).dependent(:destroy) }
    end

    context 'presence' do
      it { expect(dish).to validate_presence_of(:name) }
    end

    context 'format' do
      it { expect(dish).to_not allow_value(nil).for(:name) }
    end
  end
end
