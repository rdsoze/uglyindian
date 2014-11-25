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

  describe "GET spotfixes" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:attendees1) { create_list(:attendee, 3, { user_id: user1.id }) }
    let!(:attendees2) { create_list(:attendee, 5, { user_id: user2.id }) }
    let(:spotfixes) { json_get :spotfixes, id: user1.id }

    it "should return all spotfixes which the user is attending" do
      expect(spotfixes.body.count).to eq(3)
    end

    it "should return 200 response code" do
      expect(spotfixes.status).to eq(200)
    end
  end

  describe "GET attendee count" do
    let!(:city) { create(:city) }
    let!(:spotfix_1) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_2) { create(:spotfix, { city_id: city.id }) }
    let!(:spotfix_3) { create(:spotfix, { city_id: city.id + 1 }) }
    let!(:guests_1) { create_list(:attendee, 2, :attended, { spotfix_id: spotfix_1.id })}
    let!(:guests_2) { create_list(:attendee, 3, :attended, { spotfix_id: spotfix_2.id })}
    let!(:guests_3) { create_list(:attendee, 4, :attended, { spotfix_id: spotfix_3.id })}
    let(:attendee_count) { json_get :count }

    it "should return count of attendees in a particular city" do
      expect(attendee_count.body.attendees).to eq(9)
    end

    it "should return 200 response code" do
      expect(attendee_count.status).to eq(200)
    end
  end

end
