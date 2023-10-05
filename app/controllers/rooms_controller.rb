class RoomsController < ApplicationController

    def index
    end
  
    def show
    end
  
    def new
        @user_id = current_user.id
    end
  
    def create
        @user_id = current_user.id
        @user_id.save
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

end
