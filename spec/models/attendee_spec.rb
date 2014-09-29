require 'rails_helper'

describe Attendee do
  it { should belong_to(:user) }
  it { should belong_to(:spotfix) }
end
