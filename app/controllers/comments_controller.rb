class CommentsController < ApplicationController
  def create
    comment = Comment.create(params)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

  end

  def upvote
    comment = Comment.find(params[:id])
    comment.upvote += 1
    if comment.save
      render json: comment.to_json, status: 200
    else
      render json: comment.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end
end