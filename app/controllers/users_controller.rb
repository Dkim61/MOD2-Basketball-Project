class UsersController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update]

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        puts user_params

        if @user.valid?
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])

    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
        


    private

    def user_params
        params.require(:user).permit(:user_name, :full_name, :email, :age)
    end

    def find_song
        @user = User.find(params[:id])
    end

end
