require 'rails_helper'

describe Game do
  before(:all) { create(:game) }

  it { should have_many(:formats) }
  it { should have_many(:leagues).through(:formats) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  it { should validate_length_of(:name).is_at_most(128) }
end
