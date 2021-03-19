class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column(:title, :string)
      t.column(:rating, :integer)

      t.timestamps
    end
  end
end
