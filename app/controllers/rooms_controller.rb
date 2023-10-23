class RoomsController < ApplicationController

    before_action :set_q, only: [:index, :search]

    def index
        @rooms = Room.all
    end

    def index_current_user
        @user = User.find_by(id: current_user.id)
        @rooms = @user.rooms
    end
  
    def show
        @room = Room.find(params[:id])
        @reservation = Reservation.new
    end
  
    def new
        @room = Room.new
    end
  
    def create
        @room = Room.new(room_params)
        @room.user_id = current_user.id
        if @room.save
            flash[:notice] = "施設を新規作成しました"
            redirect_to rooms_path
        else
            flash.now[:notice] = "施設の作成に失敗しました"
            render "new"
        end
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    def search
        @results = @q.result
    end
    

    private

    def room_params
        params.require(:room).permit(:room_name, :room_info, :room_image, :room_price , :room_address,)
    end

    def set_q
        @q = Room.ransack(params[:q])
    end

end
