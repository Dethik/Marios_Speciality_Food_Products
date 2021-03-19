class Review < ApplicationRecord
  belongs_to :users
  has_and_belongs_to_many :reviews
  validates :title, presence: true

end