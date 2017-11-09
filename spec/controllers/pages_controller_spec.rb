require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  authorized_user! :index

  context 'with authorization' do
    login_user

    describe 'GET index' do
      it 'should render the index page' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
