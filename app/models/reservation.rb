class Reservation < ApplicationRecord
    acts_as_paranoid column: :deleted_at
    
    validates :book_id, presence: true
end
