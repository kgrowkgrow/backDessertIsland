class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def create
        byebug
        user = User.new(user_params)

        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else 
            render json: user.errors
        end

    end

    def login 
        byebug
        user = User.find_by(name: params[:name])
        #has_secure_password gives us authenticate method
        if user && user.authenticate(params[:password])
            render json: user
        else 
            render json: {error: "Incorrect Username or Password"}
        end
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

    private

    def user_params 
        params.permit(:password, :name, :diabetic, :carb_ratio)
    end




end
