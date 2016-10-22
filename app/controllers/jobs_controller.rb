class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :find_company, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @jobs = @company.jobs
    @contacts = Contact.where(company: @company)
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job_id
  end

  def edit
    # implement on your own!
  end

  def update
    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

end
