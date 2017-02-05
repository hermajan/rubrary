class Book < ApplicationRecord
    belongs_to :author
    default_scope { order(name: :asc) }
    acts_as_paranoid column: :deleted_at
    
    validates :name, :author, :year, presence: true
    validates :id, uniqueness: true
end
