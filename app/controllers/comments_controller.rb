class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job = params[:job]

    @comment.save

    redirect_to company_job_path(@comment.job)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
