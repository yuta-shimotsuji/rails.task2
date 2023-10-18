class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all

        @user = User.find(current_user.id)
        @reservation_rooms = @user.reservation_rooms
    end

    def confirm

        @start_day = reservation_params[:start_day]
        @last_day = reservation_params[:last_day]
        @numofpeople = reservation_params[:number_of_people]
        
        if @start_day.blank? || @last_day.blank? || @numofpeople.blank?

            @room_params = Room.find(params[:id])
            
            flash[:notice] = "予約に失敗しました"
            redirect_to "/rooms/#{@room_params.id}"

        elsif @start_day.present? && @last_day.present? && @numofpeople.present?

            start_day = reservation_params[:start_day]
            last_day = reservation_params[:last_day]
            start_day = start_day.to_date
            last_day = last_day.to_date
            days = (last_day - start_day).to_i

            number_of_people = reservation_params[:number_of_people]

            @room = Room.find(params[:id])

            @reservation = current_user.reservations.build
            @reservation.start_day = start_day
            @reservation.last_day = last_day
            @reservation.number_of_people = reservation_params[:number_of_people].to_i
            @reservation.room_id = @room.id
            @reservation.user_id = current_user.id
            total_amount = @room.room_price.to_i * days
            @reservation.total_amount = total_amount.to_i * number_of_people.to_i
            @reservation.stay_days = days
        
        else

            @room_params = Room.find(params[:id])
            
            flash[:notice] = "予約に失敗しました"
            redirect_to "/rooms/#{@room_params.id}"

        end


    end

    def create

        @start_day = reservation_params[:start_day]
        @last_day = reservation_params[:last_day]
        @numofpeople = reservation_params[:number_of_people]
        
        if @start_day.blank? || @last_day.blank? || @numofpeople.blank?

            @room_params = Room.find(params[:room_id])
            
            flash[:notice] = "予約に失敗しました"
            redirect_to "/rooms/#{@room_params.id}"

        elsif @start_day.present? && @last_day.present? && @numofpeople.present?

            start_day = reservation_params[:start_day]
            last_day = reservation_params[:last_day]
            start_day = start_day.to_date
            last_day = last_day.to_date
            days = (last_day - start_day).to_i

            number_of_people = reservation_params[:number_of_people]

            @room = Room.find(params[:room_id])

            @reservation = current_user.reservations.build
            @reservation.start_day = start_day
            @reservation.last_day = last_day
            @reservation.number_of_people = reservation_params[:number_of_people].to_i
            @reservation.room_id = @room.id
            @reservation.user_id = current_user.id
            total_amount = @room.room_price.to_i * days
            @reservation.total_amount = total_amount.to_i * number_of_people.to_i
            @reservation.stay_days = days

            
            if @reservation.save

                flash[:notice] = "予約しました。"
                redirect_to reservations_index_path

            else
                @room_params = Room.find(params[:room_id])
                
                flash[:notice] = "予約に失敗しました"
                redirect_to "/rooms/#{@room_params.id}"
            end
        
        else

            @room_params = Room.find(params[:room_id])
            
            flash[:notice] = "予約に失敗しました"
            redirect_to "/rooms/#{@room_params.id}"

        end

    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_day, :last_day, :number_of_people)
    end

end