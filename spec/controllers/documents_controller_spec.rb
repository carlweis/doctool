require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  describe "anonymous user" do
    before(:each) do
      # This simulates an anonymous user
      login_with nil
    end

    it "should redirect to signin" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
