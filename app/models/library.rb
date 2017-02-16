class Library < ApplicationRecord
	acts_as_paranoid column: :deleted_at
	
	validates :name, presence: true
end
