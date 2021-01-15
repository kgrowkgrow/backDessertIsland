class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)

        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else 
            render json: user.errors
        end

    end

     
    def login 
        user = User.find_by(name: params[:name])
        #has_secure_password gives us authenticate method
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render_user(user, token)
        else 
            render json: {error: "Incorrect Username or Password"}
        end
    end

    def update
        user = User.find(params[:id])
        token = encode_token({user_id: user.id})

        user.update(user_params)
        if user.save
            render_user(user, token)
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

    def render_user(user, token)
        render json: {user: {name: user.name}, token: token} #add diabetes stuff
    end

    


end
