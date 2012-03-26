class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :user_id
      t.date :tour_date
      t.string :additional_questions
      t.integer :rating
      t.string :amenities
      t.timestamps
    end
  end
end
