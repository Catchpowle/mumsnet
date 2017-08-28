require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:categories_products) }
  it { is_expected.to have_many(:categories) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:user_id) }

  describe '.all' do
    let!(:product_one) { create(:product) }
    let!(:product_two) { create(:product) }

    it 'orders by created_at descending' do
      expect(Product.all).to eq([product_two, product_one])
    end
  end
end
