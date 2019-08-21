require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    let(:password) { "secretpassword" }
    let(:email) { "homer@simpson.com" }

    before { create(:user, email: email, password: password, password_confirmation: password) }

    context "with valid_credentials" do
      it "redirects to the home page" do
        get :create, params: { email: email, password: password }
        expect(response).to redirect_to(root_url)
      end
      it "sets the session with the user id" do
        get :create, params: { email: email, password: password }
        expect(session[:current_user_id]).to_not be_nil
      end
    end
    context "with invalid_password" do
      let(:bad_password) { "badpassword" }

      it "redirects to the login page" do
        get :create, params: { email: email, password: bad_password }
        expect(response).to redirect_to(new_session_path)
      end
    end
    context "with invalid_email" do
      let(:bad_email) { "bademail" }

      it "redirects to the login page" do
        get :create, params: { email: bad_email, password: password }
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #destroy" do
    it "redirects to the home page" do
      get :destroy
      expect(response).to redirect_to(root_url)
    end
    it "destroys the users session" do
      get :destroy
      expect(session[:current_user_id]).to be_nil
    end
  end

end
