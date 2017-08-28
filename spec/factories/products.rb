FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    description 'Description'
    user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'test_files', 'products', 'image.png'), 'image/png') }
  end
end
