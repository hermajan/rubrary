require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
	
	setup do
		sign_in users(:root)
	end
	
	teardown do
		Rails.cache.clear
	end
	
	test 'should get index' do
		get reservations_path
		assert_response :success
	end

	test 'should show reservation' do 
		reservation = reservations(:first)
		get reservations_path(reservation)
		assert_response :success
	end

	test 'should create reservation' do
		get new_reservation_path
		assert_response :success
		
		assert_difference('Reservation.count') do
			post reservations_path, params: { reservation: { book_id: 1 } }
		end
	end

	test 'should update reservation' do
		reservation = reservations(:first)
		patch reservation_url(reservation), params: { reservation: { book_id: 3 } }
		assert_redirected_to reservation_path(reservation)
		reservation.reload
		assert_equal 3, reservation.book_id
	end

	test 'should destroy reservation' do
		reservation = reservations(:second)
		assert_difference('Reservation.count', -1) do
			delete reservation_path(reservation) 
		end
		assert_redirected_to reservations_path
	end
end
