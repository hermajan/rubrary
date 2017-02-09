class Author < ApplicationRecord
	has_many :books, dependent: :destroy
	default_scope { order(name: :asc) }
	acts_as_paranoid column: :deleted_at

	validates :name, presence: true
end
