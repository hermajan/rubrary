class Role < ApplicationRecord
	acts_as_paranoid column: :deleted_at
	
	validates :name, :fullName, presence: true
end
