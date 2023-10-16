class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all

        @user = User.find(current_user.id)
        @reservation_rooms = @user.reservation_rooms
    end

    def create
        
            start_day = Date.parse(reservation_params[:start_day])
            last_day = Date.parse(reservation_params[:last_day])
            days = (last_day - start_day).to_i + 1
            number_of_people = reservation_params[:number_of_people]

            @room = Room.find(params[:room_id])
            @reservation = current_user.reservations.build(reservation_params)
            @reservation.room_id = @room.id
            @reservation.user_id = current_user.id
            total_amount = @room.room_price.to_i * days
            @reservation.total_amount = total_amount.to_i * number_of_people.to_i
            @reservation.stay_days = days

        if @reservation.save
            flash[:notice] = "予約しました。"
            redirect_to reservations_index_path
        else
            flash[:notice] = "予約に失敗しました"
            render 'rooms/show'
        end

    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_day, :last_day, :number_of_people)
    end

end