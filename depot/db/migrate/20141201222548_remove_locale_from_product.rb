class RemoveLocaleFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :locale
  end
end
