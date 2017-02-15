require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test 'author without name' do
		author = Author.new
		assert_not author.save, 'Saved the author without a name'
	end
	
	test "author name" do
		assert_equal "J.R.R. Tolkien", authors(:tolkien).name
	end
end
