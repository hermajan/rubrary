class CreateRoles < ActiveRecord::Migration[5.0]
	def change
		create_table :roles do |t|
			t.string :name
			t.string :fullName
			t.datetime :deleted_at

			t.timestamps
		end
	end
end
