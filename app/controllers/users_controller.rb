class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

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

    def destroy
        @user.destroy
        redirect_to 
    end
        


    private

    def user_params
        params.require(:user).permit(:user_name, :full_name, :email, :age)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
