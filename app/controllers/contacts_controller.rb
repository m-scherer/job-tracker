class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You created #{@contact.name} at #{@company.name}"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @company = Company.find(params[:company_id])
    if @contact.update(contact_params)
      flash[:success] = "You updated #{@contact.name} at #{@company.name}"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @company = Company.find(params[:company_id])
    @contact.destroy
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email)
  end

end
