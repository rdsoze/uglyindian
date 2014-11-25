require 'rails_helper'
require 'pry'

describe Api::SpotfixesController do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:city) { FactoryGirl.create(:city) }

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:spotfix, { user_id: user.id, city_id: city.id }) }
      
      it "creates a new spotfix" do
        expect { create }.to change{ Spotfix.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:spotfix) { create(:spotfix) }
    let(:show) { json_get :show, { id: spotfix.id } }
    
    it "should return the spotfix" do
      expect(show.body.keys).to eq(["id", "name", "description", "fix_date", "latitude", "longitude", "city_id", "needs", "attendees"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:spotfix) { create(:spotfix) }
    let(:update) { json_put :update, { id: spotfix.id, name: 'new spotfix' } }

    it "should update the spotfix" do
      expect { update }.to change { Spotfix.first.name }.to('new spotfix')
    end

    it "should return the spotfix" do
      expect(update.body.keys).to eq(["id", "name", "description", "fix_date", "latitude", "longitude", "city_id", "needs", "attendees"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:spotfix) { create(:spotfix) }
    let(:destroy) { json_delete :destroy, { id: spotfix.id } }

    it "should delete the spotfix" do
      expect { destroy }.to change{ Spotfix.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

  describe "GET join" do
    let!(:spotfix) { create(:spotfix) }
    let!(:user) { create(:user) }
    let(:join) { json_get :join, { user_id: user.id, id: spotfix.id }}

    it "should create an attendee" do
      expect { join }.to change{ Attendee.count }.by(1)
    end

    it "should return 200 response code" do
      expect(join.status).to eq(200)
    end
  end

  describe "GET leave" do
    let!(:spotfix) { create(:spotfix) }
    let!(:user) { create(:user) }
    let!(:attendee) { create(:attendee, { user_id: user.id, spotfix_id: spotfix.id })}
    let(:leave) { json_get :leave, { user_id: user.id, id: spotfix.id }}

    it "should delete the attendee" do
      expect { leave }.to change{ Attendee.count }.by(-1)
    end

    it "should return 200 response code" do
      expect(leave.status).to eq(200)
    end
  end

  describe "GET attendees" do
    let!(:spotfix) { create(:spotfix) }
    let!(:guests) { create_list(:attendee, 2, { spotfix_id: spotfix.id })}
    let(:attendees) { json_get :attendees, { id: spotfix.id }}

    it "should return the correct count of attendees" do
      expect(attendees.body.count).to eq(2)
    end

    it "should return the attendees details" do
      expect(attendees.body[0].keys).to eq(["id", "user_id", "spotfix_id"])
    end

    it "should return 200 response code" do
      expect(attendees.status).to eq(200)
    end
  end

  describe "GET spotfix count" do
    let!(:city) { create(:city) }
    let!(:spotfix_1) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_2) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_3) { create(:spotfix, { city_id: city.id + 1 }) }
    let(:spotfix_count) { json_get :count }

    it "should return count of all spotfixes in India" do
      expect(spotfix_count.body.spotfixes).to eq(3)
    end

    it "should return 200 response code" do
      expect(spotfix_count.status).to eq(200)
    end
  end

end
