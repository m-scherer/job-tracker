class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    job = Job.find(params[:job_id])
    @comment = job.comments.new(comment_params)

    if @comment.save
      redirect_to company_job_path(@comment.job.company ,@comment.job)
    else
      render :show
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
