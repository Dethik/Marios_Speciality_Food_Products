class User < ApplicationRecord
  has_many :products
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  before_save(:titleize_user)

  private
    def titleize_user
      self.name = self.name.titleize
    end
end