class AddProductLocaleToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :product_locale, :string
  end

  def self.down
    remove_column :products, :product_locale
  end
end
