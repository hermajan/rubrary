class Role < ApplicationRecord
	validates :name, :fullName, presence: true
end
