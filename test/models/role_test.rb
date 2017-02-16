require 'test_helper'

class RoleTest < ActiveSupport::TestCase
	test 'role without name' do
		role = Role.new
		assert_not role.save, 'Saved the role without a name'
	end
	
	test 'role create' do
		role = Role.new
		role.name = 'editor'
		role.fullName = 'Editor'
		assert role.save
	end
	
	test 'role read' do
		assert_equal 'admin', roles(:admin).name
		assert_equal 'Administrator', roles(:admin).fullName
	end
	
	test 'role update' do
		role = Role.find_by(id: 1)
		assert_equal 'admin', role.name
		role.update(name: 'adminis')
		assert_equal 'adminis', role.name
	end
	
	test 'role delete' do
		role = Role.find_by(id: 2)
		role.delete
		assert_not_nil role.deleted_at
	end
end
