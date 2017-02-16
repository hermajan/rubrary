require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test 'user without email' do
		user = User.new
		assert_not user.save, 'Saved the user without a email'
	end
	
	# test 'user create' do
	# 	user = User.create
	# 	user.email = 'user@test'
	# 	assert user.save
	# end
	
	test 'user read' do
		assert_equal 'toor@test', users(:toor).email
	end
	
	test 'user update' do
		user = User.find_by(id: 1)
		assert_equal 'root@test', user.email
		user.update(email: 'root@test.com')
		assert_equal 'root@test.com', user.email
	end
	
	# test 'user delete' do
	# 	user = User.find_by(id: 2)
	# 	user.destroy!
	# 	assert_not_nil user.deleted_at
	# end
end
