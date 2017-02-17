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
    p '*' * 100
    p params
    comment = Comment.find(params[:comment_id])
    comment.upvotes += 1
    comment.save!
    # if comment.save
    #   render json: comment.to_json, status: 200
    # else
    #   render json: comment.errors.full_messages.to_sentence, status: :unprocessable_entity
    # end
    render json: comment.to_json
  end
end