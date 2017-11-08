require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:dish) { create(:dish) }
  let(:menu) { create(:menu) }
  let(:menu_page) { create(:menu_page, menu_id: menu.id) }
  let(:menu_item) { create(:menu_item, menu_page_id: menu_page.id, dish_id: dish.id) }

  it 'has a valid factory' do
    expect(build(:menu_item, menu_page_id: menu_page.id, dish_id: dish.id)).to be_valid
  end

  describe 'validations' do
    context 'model dependencies' do
      it { expect(menu_item).to belong_to(:dish) }
      it { expect(menu_item).to belong_to(:menu_page) }
    end

    context 'presence' do
      it { expect(menu_item).to validate_presence_of(:menu_page_id) }
      it { expect(menu_item).to validate_presence_of(:dish_id) }
    end
  end
end
