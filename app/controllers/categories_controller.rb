class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      redirect_to new_category_path ## render :new was changing the path to categories_path -- why?
    end
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end

end
