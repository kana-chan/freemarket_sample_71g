require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #index' do
    it "indexのビュー取れてるで" do
      get :index
      expect(response).to render_template :index
    end
  end
end