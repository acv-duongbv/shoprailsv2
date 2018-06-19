require "rails_helper"
RSpec.describe Order, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:address) }
  it { should have_many(:line_items) }
  it { should belong_to(:user) }
  it { should validate_numericality_of(:phone_number) }
end
