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

    context "with valid_credentials" do
      it "redirects to the home page" do
        get :create, params: { email: email, password: password }
        expect(response).to redirect_to(root_url)
      end
      it "sets the session with the user id" do
        get :create, params: { email: email, password: password }
        expect(session[:current_user_id]).to_not be_nil
      end
      it "sets the flash notice message" do
        get :create, params: { email: email, password: password }
        expect(flash[:notice]).to eq("Welcome Back!")
      end
    end
    context "with invalid_password" do
      let(:bad_password) { "badpassword" }

      it "redirects to the login page" do
        get :create, params: { email: email, password: bad_password }
        expect(response).to redirect_to(new_session_path)
      end
      it "sets the flash error message" do
        get :create, params: { email: email, password: bad_password }
        expect(flash[:error]).to eq("Could not log you in")
      end
    end
    context "with invalid_email" do
      let(:bad_email) { "bademail" }

      it "redirects to the login page" do
        get :create, params: { email: bad_email, password: password }
        expect(response).to redirect_to(new_session_path)
      end
      it "sets the flash error message" do
        get :create, params: { email: bad_email, password: password }
        expect(flash[:error]).to eq("Could not log you in")
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
    it "sets the flash notice message" do
      get :destroy
      expect(flash[:notice]).to eq("You've successfully logged out!")
    end
  end

end
