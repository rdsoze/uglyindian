require 'rails_helper'

describe User do
  it { should have_many(:attendees) }
  it { should have_many(:spotfixes).through(:attendees) }
  it { should have_many(:photos) }
  it { should have_many(:invites) }
  it { should have_many(:inviteds) }
end
