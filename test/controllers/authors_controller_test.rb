require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
	test 'should get index' do
		get authors_path
		assert_response :success
	end

	test 'should show author' do 
		author = authors(:tolkien)
		get authors_path(author)
		assert_response :success
	end

	# test 'should create author' do
	# 	assert_difference('Author.count') do
	# 		post author_path, params: { author: { name: 'George Orwell' } }
	# 	end
	# 	assert_redirected_to authors_path(Author.last)
	# end
	# 
	# test 'should update author' do
	# 	author = authors(:kasparek)
	# 	patch author_url(author), params: { author: { name: 'Michal' } }
	# 	assert_redirected_to author_path(author)
	# 	author.reload
	# 	assert_equal 'Michal', author.name
	# end
	# 
	# test 'should destroy author' do
	# 	author = authors(:kasparek)
	# 	assert_difference('Author.count', -1) do
	# 		delete author_path(author) 
	# 	end
	# 	assert_redirected_to authors_path
	# end
end
