# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy like]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Post created successfully." }
        format.js
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post deleted successfully."
    else
      redirect_to posts_path, alert: "Failed to delete post."
    end
  end

  def like
    if @post.nil?
      redirect_to posts_path, alert: "The post you are trying to like no longer exists."
      return
    end

    like = current_user.likes.find_by(post: @post)
    if like
      like.destroy
      message = "You unliked this post."
    else
      current_user.likes.create(post: @post)
      message = "You liked this post."
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: message }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    return if @post

    redirect_to posts_path, alert: "The post you are looking for does not exist."
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
