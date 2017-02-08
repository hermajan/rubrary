class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :book_id
      t.datetime :from
      t.datetime :to
	  t.integer :user_id
	  t.datetime :deleted_at

      t.timestamps
    end
  end
end
