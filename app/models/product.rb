class Product < ApplicationRecord
  belongs_to :users
  has_and_belongs_to_many :reviews
  validates :name, presence: true, uniqueness: true
  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end