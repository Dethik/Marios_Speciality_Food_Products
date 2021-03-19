class Product < ApplicationRecord
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :price, :presence => true
  before_save(:titleize_product)


  
  private
    def titleize_product
      self.name = self.name.titleize
    end
end