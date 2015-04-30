class CommentsController < ApplicationController

  def index
      @comments = policy_scope(Comment)
    end

  def new
      @comment = Comment.new
      authorize @comment
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comment_path(@task)
    else
      render :new
    end
    authorise @comment
  end
end


