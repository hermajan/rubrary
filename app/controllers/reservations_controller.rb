class ReservationsController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @reservations = Reservation.all.order(:id)
    #@important = Task.where("priority < '0'").order(:priority).all
  end

  def show
    @reservation = Reservation.find(params[:id])
    #@reservation.tasks = @reservation.tasks.where('reservation_id' => params[:id]).order(:priority)
  end

  def completed
    @reservation = Reservation.find(params[:id])
    #@completed_tasks = @reservation.tasks.where('reservation_id' => params[:id]).order(:priority).only_deleted

    render 'show'
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
    #   task.really_destroy!
    # end
    @reservation.destroy

    redirect_to reservations_path
  end

  private
    def reservation_params
      params.require(:reservation).permit(:book_id, :user_id, :from, :to)
    end
end
