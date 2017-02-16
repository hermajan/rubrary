require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test 'author without name' do
		author = Author.new
		assert_not author.save, 'Saved the author without a name'
	end
	
	test 'author create' do
		author = Author.new
		author.name = 'George Orwell'
		assert author.save
	end
	
	test 'author read' do
		assert_equal 'J.R.R. Tolkien', authors(:tolkien).name
	end
	
	test 'author update' do
		author = Author.find_by(id: 1)
		assert_equal 'J.R.R. Tolkien', author.name
		author.update(name: 'Tolkien')
		assert_equal 'Tolkien', author.name
	end
	
	test 'author delete' do
		author = Author.find_by(id: 2)
		author.destroy
		assert_not_nil author.deleted_at
	end
end
