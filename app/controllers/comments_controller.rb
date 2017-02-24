class CommentsController < ApplicationController
  def create
    comment = Comment.create(
      post_id: params[:post_id],
      body:    params[:body]
    )

    if comment.save
      render json: comment.to_json
    else
      render json: comment.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def destroy
    # no destroy yet
  end

  def upvote
    comment = Comment.find(params[:comment_id])
    comment.upvotes += 1
    comment.save!
    render json: comment.to_json
  end
end