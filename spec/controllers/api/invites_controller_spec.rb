require 'rails_helper'
require 'pry'

describe Api::InvitesController do
  render_views
  let(:spotfix) { FactoryGirl.create(:spotfix) }
  let(:user) { FactoryGirl.create(:user) }
  let(:invitee) { FactoryGirl.create(:user) }

  describe "POST create" do
    context "with valid params" do
      let(:create) { json_post :create, attributes_for(:invite, { spotfix_id: spotfix.id, user_id: user.id, invitee_user_id: invitee.id }) }
      
      it "creates a new invite" do
        expect { create }.to change{ Invite.count }.by(1)
      end

      it "should return 200 response code" do
        expect(create.status).to eq(200)
      end
    end
  end

  describe "GET show" do
    let!(:invite) { create(:invite) }
    let(:show) { json_get :show, { id: invite.id } }
    
    it "should return the invite" do
      expect(show.body.keys).to eq(["id", "user_id", "invitee_user_id", "spotfix_id"])
    end

    it "should return 200 response code" do
      expect(show.status).to eq(200)
    end
  end

  describe "PUT update" do
    let!(:invite) { create(:invite) }
    let(:update) { json_put :update, { id: invite.id, invitee_user_id: invitee.id } }

    it "should update the invite" do
      expect { update }.to change { Invite.first.invitee_user_id }.to(invitee.id)
    end

    it "should return the invite" do
      expect(update.body.keys).to eq(["id", "user_id", "invitee_user_id", "spotfix_id"])
    end

    it "should return 200 response code" do
      expect(update.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    let!(:invite) { create(:invite) }
    let(:destroy) { json_delete :destroy, { id: invite.id } }

    it "should delete the invite" do
      expect { destroy }.to change{ Invite.count }.by(-1)      
    end

    it "should return 200 response code" do
      expect(destroy.status).to eq(200)
    end
  end

end
