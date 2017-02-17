require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
	test 'reservation without book id' do
		reservation = Reservation.new
		assert_not reservation.save, 'Saved the reservation without a book id'
	end
	
	test 'reservation create' do
		reservation = Reservation.new
		reservation.book_id = 2
		assert reservation.save
	end
	
	test 'reservation read' do
		assert_equal 1, reservations(:first).book_id
		assert_equal 2, reservations(:second).user_id
	end
	
	test 'reservation update' do
		reservation = Reservation.find_by(id: 1)
		assert_equal 1, reservation.book_id
		reservation.update(book_id: 8)
		assert_equal 8, reservation.book_id
	end
	
	test 'reservation delete' do
		reservation = Reservation.find_by(id: 2)
		reservation.destroy
		assert_not_nil reservation.deleted_at
	end
end
