class PostsController < ApplicationController

  def index
    render json: post = Post.all.to_json
  end

  def create
    post = Post.create(title: params[:title], link: params[:link])

    if post.save
      render json: post, status: :created, location: post
    else
      render json: post.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def show
    respond_with post = Post.find(params[:id]).to_json
    # render json: {
    #   post: post,
    #   comments: post.comments.to_json
    # }
    #render json: post.to_json, status: 200, location: post
  end

  def destroy
    # no destroy yet
  end

  def upvote
    post = Post.find(params[:id])
    post.upvotes += 1

    if post.save
      render json: post, status: 200, location: post
    else
      render json: post.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end
end
