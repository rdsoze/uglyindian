require 'rails_helper'

describe Spotfix do
  it { should belong_to(:leader) }
  it { should have_many(:needs) }
  it { should have_many(:attendees) }
  it { should have_many(:users).through(:attendees) }
  it { should have_many(:photos) }
  it { should have_many(:invites) }
  it { should have_many(:invited_users) }
end
