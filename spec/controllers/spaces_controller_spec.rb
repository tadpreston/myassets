require 'rails_helper'

RSpec.describe SpacesController, type: :controller do

  let(:valid_attributes) { attributes_for(:space) }
  let(:invalid_attributes) { {name: nil, description: "blah"} }

  let(:user) { create(:user) }
  let(:space) { create(:space, user: user) }
  let(:valid_session) { { current_user_id: user.id} }

  describe "GET #index" do
    context "with a valid session" do
      it "returns a success response" do
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
    context "with an invalid session" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #show" do
    context "with a valid session" do
      it "returns a success response" do
        get :show, params: {id: space.to_param}, session: valid_session
        expect(response).to be_successful
      end
      context "accessing an unauthorized space" do
        it "raises an error" do
          other_space = create(:space)
          expect {get :show, params: {id: other_space.to_param}, session: valid_session}.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
    context "with an invalid session" do
      it "redirects to the login page" do
        get :show, params: {id: space.to_param}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #new" do
    context "with a valid session" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
    context "with an invalid session" do
      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #edit" do
    context "with a valid session" do
      it "returns a success response" do
        get :edit, params: {id: space.to_param}, session: valid_session
        expect(response).to be_successful
      end
      context "accessing an invalid space" do
        it "raises an error" do
          other_space = create(:space)
          expect {get :edit, params: {id: other_space.to_param}, session: valid_session}.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
    context "with an invalid session" do
      it "redirects to the login page" do
        get :edit, params: {id: space.to_param}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "POST #create" do
    context "with a valid session" do
      context "with valid params" do
        it "creates a new Space" do
          expect {
            post :create, params: {space: valid_attributes}, session: valid_session
          }.to change(Space, :count).by(1)
        end

        it "redirects to the created space" do
          post :create, params: {space: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Space.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {space: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end
    context "with an invalid session" do
      it "is not successful" do
        post :create, params: {space: valid_attributes}
        expect(response).to_not be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_description) {"a new description"}
      let(:new_attributes) { {description: new_description} }

      it "updates the requested space" do
        put :update, params: {id: space.to_param, space: new_attributes}, session: valid_session
        space.reload
        expect(space.description).to eq(new_description)
      end

      it "redirects to the space" do
        put :update, params: {id: space.to_param, space: valid_attributes}, session: valid_session
        expect(response).to redirect_to(space)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: space.to_param, space: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    context "with valid session" do
      it "destroys the requested space" do
        space = create(:space, user: user)
        expect {
          delete :destroy, params: {id: space.to_param}, session: valid_session
        }.to change(Space, :count).by(-1)
      end

      it "redirects to the spaces list" do
        delete :destroy, params: {id: space.to_param}, session: valid_session
        expect(response).to redirect_to(spaces_url)
      end
      context "accessing an unauthorized space" do
        it "raises an error" do
          other_space = create(:space)
          expect {
            delete :destroy, params: {id: other_space.to_param}, session: valid_session
          }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

end
