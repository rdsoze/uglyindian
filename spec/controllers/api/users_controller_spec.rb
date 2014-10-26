require 'rails_helper'
require 'pry'

describe Api::UsersController do
  render_views

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:user) }
      
      it "creates a new user" do
        expect { create }.to change{ User.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:user) { create(:user) }
    let(:show) { json_get :show, { id: user.id } }
    
    it "should return the user" do
      expect(show.body.keys).to eq(["id", "name", "gender", "location", "uid", "city_id", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:user) { create(:user) }
    let(:update) { json_put :update, { id: user.id, name: 'new user' } }

    it "should update the user" do
      expect { update }.to change { User.first.name }.to('new user')
    end

    it "should return the user" do
      expect(update.body.keys).to eq(["id", "name", "gender", "location", "uid", "city_id", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:user) { create(:user) }
    let(:destroy) { json_delete :destroy, { id: user.id } }

    it "should delete the user" do
      expect { destroy }.to change{ User.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

end
