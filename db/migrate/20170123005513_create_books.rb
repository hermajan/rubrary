class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :year
      t.string :isbn
	  t.integer :author_id
	  t.datetime :deleted_at

      t.timestamps
    end
  end
end
