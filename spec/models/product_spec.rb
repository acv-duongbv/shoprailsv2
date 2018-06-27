# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image_url) }
    it { should validate_numericality_of(:price) }
  end
  context 'assosiation' do
    it { should belong_to(:category) }
    it { should have_many(:line_items) }
  end
end
