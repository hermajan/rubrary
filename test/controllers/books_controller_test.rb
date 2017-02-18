require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
	
	setup do
		sign_in users(:root)
	end
	
	teardown do
		Rails.cache.clear
	end
	
	test 'should get index' do
		get books_path
		assert_response :success
	end

	test 'should show book' do 
		book = books(:hobit)
		get books_path(book)
		assert_response :success
	end

	test 'should create book' do
		get new_book_path
		assert_response :success
		
		assert_difference('Book.count') do
			post books_path, params: { book: { name: '1984', author_id: 1, year: 1949, isbn: '9780141036144' } }
		end
	end

	test 'should update book' do
		book = books(:hobit)
		patch book_url(book), params: { book: { name: 'Hobit' } }
		assert_redirected_to book_path(book)
		book.reload
		assert_equal 'Hobit', book.name
	end

	test 'should destroy book' do
		book = books(:poznej)
		assert_difference('Book.count', -1) do
			delete book_path(book) 
		end
		assert_redirected_to books_path
	end
end
