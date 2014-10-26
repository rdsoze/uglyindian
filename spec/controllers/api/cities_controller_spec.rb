require 'rails_helper'
require 'pry'

describe Api::CitiesController do
  render_views

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:city) }
      
      it "creates a new city" do
        expect { create }.to change{ City.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:city) { create(:city) }
    let(:show) { json_get :show, { id: city.id } }
    
    it "should return the city" do
      expect(show.body.keys).to eq(["id", "name", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:city) { create(:city) }
    let(:update) { json_put :update, { id: city.id, name: 'new city' } }

    it "should update the city" do
      expect { update }.to change { City.first.name }.to('new city')
    end

    it "should return the city" do
      expect(update.body.keys).to eq(["id", "name", "latitude", "longitude"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:city) { create(:city) }
    let(:destroy) { json_delete :destroy, { id: city.id } }

    it "should delete the city" do
      expect { destroy }.to change{ City.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

end
