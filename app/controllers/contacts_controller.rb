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

  def show

  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email)
  end

end
