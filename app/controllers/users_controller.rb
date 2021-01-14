class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)

        # do in auth
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
        else 
            render json: user.errors
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    def login 
        #save for auth
    end

    private

    def user_params 
        params.require(:user).permit(:id, :password, :name, :diabetic, :carb_ratio)
    end




end
