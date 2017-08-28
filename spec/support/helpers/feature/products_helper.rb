module Helpers
  module Feature
    def fill_product_form(
      title: 'Test User',
      description: 'description',
      image: "#{Rails.root}/spec/support/test_files/products/image.png",
      categories: []
    )
      fill_in 'Title', with: title
      fill_in 'Description', with: description
      attach_file('Image', image)

      categories.each do |category|
        check(category)
      end
    end
  end
end
