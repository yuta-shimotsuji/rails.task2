class RoomsController < ApplicationController

    def index
    end
  
    def show
        @room = Room.find(params[:id])
    end
  
    def new
        @room = Room.new
    end
  
    def create
        @room = Room.new(room_params)
        @room.save
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private

    def room_params
        params.require(:room).permit(:room_name, :room_info, :room_image, :room_price , :room_address,)
    end

end
