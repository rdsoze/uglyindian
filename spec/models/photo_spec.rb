require 'rails_helper'

describe Photo do
  it { should belong_to(:spotfix) }
  it { should belong_to(:user) }
end
