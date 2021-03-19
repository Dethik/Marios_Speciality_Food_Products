class CreateReviewsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_users, id: false do |t|
      t.belongs_to :review, index: true
      t.belongs_to :user, index: true
    end
  end
end
