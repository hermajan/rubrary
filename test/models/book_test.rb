require 'test_helper'

class BookTest < ActiveSupport::TestCase
	test 'book without name' do
		book = Book.new
		assert_not book.save, 'Saved the book without a name'
	end
	
	test 'book create' do
		book = Book.new
		book.name = '1984'
		book.author_id = 1
		book.year = 1949
		book.isbn = '9780141036144'
		assert book.save
	end
	
	test 'book read' do
		assert_equal 'Hobit aneb Cesta tam a zase zpátky', books(:hobit).name
		assert_equal 1, books(:hobit).author_id
		assert_equal 1937, books(:hobit).year
		assert_equal '8020405062', books(:hobit).isbn
	end
	
	test 'book update' do
		book = Book.find_by(id: 1)
		assert_equal 'Hobit aneb Cesta tam a zase zpátky', book.name
		book.update(name: 'Hobit')
		assert_equal 'Hobit', book.name
	end
	
	test 'book delete' do
		book = Book.find_by(id: 2)
		book.destroy
		assert_not_nil book.deleted_at
	end
end
