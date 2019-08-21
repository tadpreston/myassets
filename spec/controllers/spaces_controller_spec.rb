require 'rails_helper'

RSpec.describe SpacesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Space.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

#  describe "GET #show" do
#    it "returns a success response" do
#      space = Space.create! valid_attributes
#      get :show, params: {id: space.to_param}, session: valid_session
#      expect(response).to be_successful
#    end
#  end
#
#  describe "GET #new" do
#    it "returns a success response" do
#      get :new, params: {}, session: valid_session
#      expect(response).to be_successful
#    end
#  end
#
#  describe "GET #edit" do
#    it "returns a success response" do
#      space = Space.create! valid_attributes
#      get :edit, params: {id: space.to_param}, session: valid_session
#      expect(response).to be_successful
#    end
#  end
#
#  describe "POST #create" do
#    context "with valid params" do
#      it "creates a new Space" do
#        expect {
#          post :create, params: {space: valid_attributes}, session: valid_session
#        }.to change(Space, :count).by(1)
#      end
#
#      it "redirects to the created space" do
#        post :create, params: {space: valid_attributes}, session: valid_session
#        expect(response).to redirect_to(Space.last)
#      end
#    end
#
#    context "with invalid params" do
#      it "returns a success response (i.e. to display the 'new' template)" do
#        post :create, params: {space: invalid_attributes}, session: valid_session
#        expect(response).to be_successful
#      end
#    end
#  end
#
#  describe "PUT #update" do
#    context "with valid params" do
#      let(:new_attributes) {
#        skip("Add a hash of attributes valid for your model")
#      }
#
#      it "updates the requested space" do
#        space = Space.create! valid_attributes
#        put :update, params: {id: space.to_param, space: new_attributes}, session: valid_session
#        space.reload
#        skip("Add assertions for updated state")
#      end
#
#      it "redirects to the space" do
#        space = Space.create! valid_attributes
#        put :update, params: {id: space.to_param, space: valid_attributes}, session: valid_session
#        expect(response).to redirect_to(space)
#      end
#    end
#
#    context "with invalid params" do
#      it "returns a success response (i.e. to display the 'edit' template)" do
#        space = Space.create! valid_attributes
#        put :update, params: {id: space.to_param, space: invalid_attributes}, session: valid_session
#        expect(response).to be_successful
#      end
#    end
#  end
#
#  describe "DELETE #destroy" do
#    it "destroys the requested space" do
#      space = Space.create! valid_attributes
#      expect {
#        delete :destroy, params: {id: space.to_param}, session: valid_session
#      }.to change(Space, :count).by(-1)
#    end
#
#    it "redirects to the spaces list" do
#      space = Space.create! valid_attributes
#      delete :destroy, params: {id: space.to_param}, session: valid_session
#      expect(response).to redirect_to(spaces_url)
#    end
#  end

end
