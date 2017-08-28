require 'rails_helper'

RSpec.describe CategoriesProduct, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:product) }
end
