class CommentsController < ApplicationController

    before_action :logged_in?, only: [:create]

    def index 
        comments = Comment.all
        render json: comments  
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def create
        comment = Comment.new(comment_params)
        comment.update(user_id: current_user.id)
        if comment.save 
            render_comment(comment)
        else 
            render json: comment.errors
        end  
    end

    def update 
        comment = Comment.find(params[:id])
        comment.update(comment_params)
        if comment.save
            render json: comment
        else 
            render json: comment.errors
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :recipe_id, :content)
    end

    def render_comment(comment)
        render json: {comment: {content: comment.content, recipe_id: comment.recipe_id, user_id: comment.user_id}}
    end
end
