require 'rails_helper'

RSpec.describe MenuPage, type: :model do
  let(:menu) { create(:menu) }
  let(:menu_page) { create(:menu_page, menu_id: menu.id) }

  it 'has a valid factory' do
    expect(build(:menu_page, menu_id: menu.id)).to be_valid
  end

  describe 'validations' do
    context 'model dependencies' do
      it { expect(menu_page).to have_many(:menu_items).dependent(:destroy) }
    end

    context 'presence' do
      it { expect(menu_page).to validate_presence_of(:menu_id) }
    end

    context 'format' do
      it { expect(menu_page).to_not allow_value(nil).for(:menu_id) }
    end
  end
end
