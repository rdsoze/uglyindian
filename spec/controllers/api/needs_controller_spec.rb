require 'rails_helper'
require 'pry'

describe Api::NeedsController do
  render_views
  let(:spotfix) { FactoryGirl.create(:spotfix) }

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:need, { spotfix_id: spotfix.id }) }
      
      it "creates a new need" do
        expect { create }.to change{ Need.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:need) { create(:need) }
    let(:show) { json_get :show, { id: need.id } }
    
    it "should return the need" do
      expect(show.body.keys).to eq(["id", "spotfix_id", "name", "count", "description"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:need) { create(:need) }
    let(:update) { json_put :update, { id: need.id, name: 'new need' } }

    it "should update the need" do
      expect { update }.to change { Need.first.name }.to('new need')
    end

    it "should return the need" do
      expect(update.body.keys).to eq(["id", "spotfix_id", "name", "count", "description"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:need) { create(:need) }
    let(:destroy) { json_delete :destroy, { id: need.id } }

    it "should delete the need" do
      expect { destroy }.to change{ Need.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

end
