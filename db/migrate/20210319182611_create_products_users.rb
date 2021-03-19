class CreateProductsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :products_users, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
    end
  end
end
