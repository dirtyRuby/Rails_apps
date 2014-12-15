require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  def new_product(image_url)
    Product.new(title: 		      "My Book Title",
                description:    "yyy",
                price: 		      1,
                image_url: 	    image_url,
                product_locale: "en"
    )
  end

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
    assert product.errors[:product_locale].any?
	end

  test "product title must be at list 10 characters" do
    product = Product.new(title:          "less",
                          description:    products(:ruby).description,
                          price:          products(:ruby).price,
                          image_url:      products(:ruby).image_url,
                          product_locale: products(:ruby).product_locale
    )
    assert product.invalid?
    product.title = "more then 10 chars"
    assert product.valid?
  end

	test "image url" do
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
				 http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }
		ok.each do |name|
			assert new_product(name).valid?, "#{name} should be valid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end

	test "product is not valid without a unique title" do
		product = Product.new( title:          products(:ruby).title,
	                         description:    "yyy",
		                       price:          1,
		                       image_url:      "fred.gif",
                           product_locale: 'en'
    )
		assert       product.invalid?
		assert_equal ["has already been taken"], product.errors[:title]
  end
end
