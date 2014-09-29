require 'rails_helper'

describe Invite do
  it { should belong_to(:user) }
  it { should belong_to(:invitee) }
  it { should belong_to(:spotfix) }  
end
