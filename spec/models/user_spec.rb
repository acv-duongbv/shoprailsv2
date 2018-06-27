require "rails_helper"
RSpec.describe User, type: :model do
  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone_number) }
  end

  context "assosiation" do
    it { should have_many(:orders) }
  end
end
