class Product < ApplicationRecord
  belongs_to_many :users
  has_and_belongs_to_many :reviews
  validates :title, presence: true, uniqueness: true
  before_save(:titleize_product)

  private
    def titleize_product
      self.title = self.title.titleize
    end
end