require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
	test 'library without name' do
		library = Library.new
		assert_not library.save, 'Saved the library without a name'
	end
	
	test 'library create' do
		library = Library.new
		library.name = 'MZK'
		assert library.save
	end
	
	test 'library read' do
		assert_equal 'Rubrary', libraries(:rubrary).name
	end
	
	test 'library update' do
		library = Library.find_by(id: 1)
		assert_equal 'Rubrary', library.name
		library.update(name: 'Rubrary library')
		assert_equal 'Rubrary library', library.name
	end
	
	test 'library delete' do
		library = Library.find_by(id: 2)
		library.destroy
		assert_not_nil library.deleted_at
	end
end
