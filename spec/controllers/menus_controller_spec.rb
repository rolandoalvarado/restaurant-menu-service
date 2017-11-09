require 'rails_helper'

RSpec.describe MenusController, :type => :controller do
  authorized_user!

  context 'with authorization' do
    login_user
    let(:menus) { create_list(:menu, 5) }

    describe 'GET index' do
      it 'render the index page' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns menu listings' do
        get :index

        expect(response).to be_success
        expect(menus.count).to eq(5)
      end
    end

    describe 'GET show' do
      let(:menu) { create(:menu) }

      it 'render the show page' do
        get :show, params: { id: menu.id }

        expect(response).to render_template(:show)
      end

      it 'returns 1 record' do
        get :show, params: { id: menu.id }

        expect(response).to be_success
        expect(menu.id).to be_present
        expect(menu.sponsor).to be_present
        expect(menu.event).to be_present
        expect(menu.venue).to be_present
        expect(menu.place).to be_present
      end
    end
  end
end
