require 'rails_helper'
require 'pry'

describe Api::PhotosController do
  render_views
  let(:spotfix) { FactoryGirl.create(:spotfix) }
  let(:user) { FactoryGirl.create(:user) }

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:photo, { spotfix_id: spotfix.id, user_id: user.id }) }
      
      it "creates a new photo" do
        expect { create }.to change{ Photo.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:photo) { create(:photo) }
    let(:show) { json_get :show, { id: photo.id } }
    
    it "should return the photo" do
      expect(show.body.keys).to eq(["spotfix_id", "user_id", "type", "image_url", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:photo) { create(:photo) }
    let(:update) { json_put :update, { id: photo.id, spotfix_id: spotfix.id } }

    it "should update the photo" do
      expect { update }.to change { Photo.first.spotfix_id }.to(spotfix.id)
    end

    it "should return the photo" do
      expect(update.body.keys).to eq(["spotfix_id", "user_id", "type", "image_url", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:photo) { create(:photo) }
    let(:destroy) { json_delete :destroy, { id: photo.id } }

    it "should delete the photo" do
      expect { destroy }.to change{ Photo.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

end
