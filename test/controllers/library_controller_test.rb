require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
	test 'should get index' do
		get '#index'
		assert_response :success
	end
end
