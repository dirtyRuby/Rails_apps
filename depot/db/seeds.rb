# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Product.delete_all
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
				description:%{<p> 
								Ruby is the fastest growing and most exciting dynamic language
								out there. If you need to get working programs delivered fast,
								you should add Ruby to your toolbox.
							</p>},
				image_url: 'ruby.jpg',
				price: 49.95)
Product.create!(title: 'CoffeScript',
                description:%{<p>
								CoffeeScript is a little language that compiles into JavaScript.
                Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart.
                CoffeeScript is an attempt to expose the good parts of JavaScript in a simple way.
							</p>},
                image_url: 'coffe.jpg',
                price: 45.95)
Payment.create!(name: "check")
Payment.create!(name: "credit_cart")
Payment.create!(name: "purchase_order")
