class LikesController < ApplicationController



    def create
        like = Like.new(like_params)
        if like.save
            render json: like
        else 
            render json: like.errors
        end
    end


    private

    def like_params
        params.require(:like).permit(:user_id, :comment_id)
    end
end
