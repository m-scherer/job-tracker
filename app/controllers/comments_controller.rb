class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job = Job.find(params[:job_id])

    @comment.save

    redirect_to company_job_path(@comment.job.company ,@comment.job)
  end

  def show
    byebug
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
