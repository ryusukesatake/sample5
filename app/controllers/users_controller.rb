class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:show]
    
    
    def show
        @users = User.find(params[:id])
        @currentUserEntry=Entry.where(user_id: current_user.id)
        @userEntry=Entry.where(user_id: @users.id)
        if @users.id == current_user.id
        else
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                        if cu.room_id == u.room_id then
                            @isRoom = true
                            @roomId = cu.room_id
                        end
                    end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
    end
    def index
        @users=User.all
    end
end