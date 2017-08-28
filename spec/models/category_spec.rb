require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to have_many(:categories_products) }
  it { is_expected.to have_many(:products) }

  it { is_expected.to validate_presence_of(:title) }

  describe '.all_by_latest_product' do
    let(:category_one) { create(:category) }
    let(:category_two) { create(:category) }

    it 'orders by the latest product added' do
      create(:product, categories: [category_one])
      expect(Category.all_by_latest_product).to eq([category_one, category_two])

      create(:product, categories: [category_two])
      expect(Category.all_by_latest_product).to eq([category_two, category_one])
    end
  end
end
