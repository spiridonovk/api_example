require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
end
