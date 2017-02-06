class ReservationsController < ApplicationController
		before_action :authenticate_user!
	
	def index
        if current_user.try(:admin?)
		    @reservations = Reservation.all.order(:id)
        else
            @reservations = Reservation.where('user_id' => current_user.id).order(:id)
		end   
	end

	def show
        @reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save
			redirect_to @reservation
		else
			render 'new'
		end
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update(reservation_params)
			redirect_to @reservation
		else
			render 'edit'
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		# tasks = @reservation.tasks.with_deleted.where('reservation_id' => params[:id])
		# tasks.each do |task|
		#	 task.really_destroy!
		# end
		@reservation.destroy

		redirect_to reservations_path
	end

	private
		def reservation_params
			params.require(:reservation).permit(:book_id, :user_id, :from, :to)
		end
end
