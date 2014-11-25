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

  describe "GET index" do
    let!(:users) { create_list(:user, 5) }
    let(:index) { json_get :index }
    
    it "should list all cities" do
      expect(index.body.count).to eq(5) 
    end

    it "should return 200 response code" do
      expect(index.status).to eq(200)
    end
  end

  describe "GET spotfixes" do
    let!(:city1) { create(:city) }
    let!(:city2) { create(:city) }
    let!(:spotfixes1) { create_list(:spotfix, 5, { city_id: city1.id }) }
    let!(:spotfixes2) { create_list(:spotfix, 5, { city_id: city2.id }) }
    let(:city1_spotfixes) { json_get :spotfixes, id: city1.id }

    it "should return all spotfixes in a city" do
      expect(city1_spotfixes.body.count).to eq(5)
    end

    it "should return 200 response code" do
      expect(city1_spotfixes.status).to eq(200)
    end
  end

  describe "GET count" do
    let!(:city) { create(:city) }
    let!(:spotfix_1) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_2) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_3) { create(:spotfix, { city_id: city.id + 1 }) }
    let!(:guests_1) { create_list(:attendee, 2, :attended, { spotfix_id: spotfix_1.id })}
    let!(:guests_2) { create_list(:attendee, 3, :attended, { spotfix_id: spotfix_2.id })}
    let!(:guests_3) { create_list(:attendee, 4, :attended, { spotfix_id: spotfix_3.id })}
    let(:count) { json_get :count, { id: city.id }}

    it "should return details of city and counts" do
      expect(count.body.keys).to eq(['id', 'name', 'count'])
    end

    it "should return count of spotfixes in a particular city" do
      expect(count.body[:count].spotfixes).to eq(2)
    end

    it "should return count of attendees in a particular city" do
      expect(count.body[:count].attendees).to eq(5)
    end

    it "should return 200 response code" do
      expect(count.status).to eq(200)
    end
  end

end
