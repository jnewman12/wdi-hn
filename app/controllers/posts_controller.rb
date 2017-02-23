class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: post = Post.all.order('created_at ASC').to_json
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
    post = Post.find(params[:id])
    response = { post: post, comments: post.comments }
    respond_with response
  end

  def destroy
    # no destroy yet
  end

  def upvote
    # post = Post.find(params[:id])
    # post.upvotes += 1
    # post.save!

    # # if post.save
    # #   render json: post, status: 200, location: post
    # # else
    # #   render json: post.errors.full_messages.to_sentence
    # # end

    # render json: post, status: 200, location: post

    @post = Post.find(params[:id])
    @post.upvotes += 1
    @post.save!
    render json: @post.to_json
  end
end
