require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { attributes_for(:user, email: "") }
  let(:current_user) { create(:user) }

  let(:valid_session) { { :current_user_id => current_user.id } }

  describe "GET #show" do
    context "when logged in" do
      it "returns a success response" do
        get :show, params: {id: current_user.to_param}, session: valid_session
        expect(response).to be_successful
      end
      context "when showing another user" do
        it "redirects to the home page" do
          user = create(:user)
          get :show, params: {id: user.to_param}, session: valid_session
          expect(response).to redirect_to(root_url)
        end
      end
    end
    context "when not loged in" do
      it "redirects to the login page" do
        get :show, params: {id: current_user.to_param}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
    it "initialized a new user object" do
      get :new, params: {}
      expect(assigns(:user)).to_not be_persisted
    end
  end

  describe "GET #edit" do
    context "when logged in" do
      it "returns a success response" do
        get :edit, params: {id: current_user.to_param}, session: valid_session
        expect(response).to be_successful
      end
      it "finds the current users record" do
        get :edit, params: {id: current_user.to_param}, session: valid_session
        expect(assigns(:user)).to eq(current_user)
      end
      context "when editing another user" do
        it "redirects to the home page" do
          user = create(:user)
          get :edit, params: {id: user.to_param}, session: valid_session
          expect(response).to redirect_to(root_url)
        end
      end
    end
    context "when not loged in" do
      it "redirects to the login page" do
        get :edit, params: {id: current_user.to_param}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end
      it "logs the user in" do
        post :create, params: {user: valid_attributes}
        expect(session[:current_user_id]).to eq(assigns(:user).id)
      end
      it "redirects to the home page" do
        post :create, params: {user: valid_attributes}
        expect(response).to redirect_to(root_url)
      end
    end
    context "with invalid params" do
      it "renders the new template" do
        post :create, params: {user: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:first_name) { "Wilbur" }
      let(:last_name) { "Pigg" }
      let(:new_attributes) {
        { first_name: first_name, last_name: last_name }
      }

      context "when logged in" do
        it "updates the requested user" do
          put :update, params: {id: current_user.to_param, user: new_attributes}, session: valid_session
          current_user.reload
          expect(current_user.first_name).to eq(first_name)
          expect(current_user.last_name).to eq(last_name)
        end
        it "redirects to the user" do
          put :update, params: {id: current_user.to_param, user: new_attributes}, session: valid_session
          expect(response).to redirect_to(current_user)
        end
        context "when updating another user" do
          it "redirects to the home page" do
            user = create(:user)
            put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
            expect(response).to redirect_to(root_url)
          end
        end
      end
      context "when not logged in" do
        it "redirects to the login page" do
          user = create(:user)
          put :update, params: {id: user.to_param, user: new_attributes}
          expect(response).to redirect_to(new_session_path)
        end
      end
    end
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: current_user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged in" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, params: {id: user.to_param}, session: { current_user_id: user.id }
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        delete :destroy, params: {id: current_user.to_param}, session: valid_session
        expect(response).to redirect_to(root_url)
      end

      it "deletes the session" do
        delete :destroy, params: {id: current_user.to_param}, session: valid_session
        expect(session[:current_user_id]).to be_nil
      end
    end
  end
end
