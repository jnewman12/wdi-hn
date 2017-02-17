class CommentsController < ApplicationController
  def create
    comment = Comment.create(
      post_id: params[:post_id],
      body:    params[:body]
    )

    if comment.save
      render json: comment.to_json, status: :created, location: comment
    else
      render json: comment.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def destroy
    # no destroy yet
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