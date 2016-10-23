require 'rails_helper'

describe 'User can enter a new contact' do
  scenario 'user can create a contact' do
    company = Company.create(name:"Full House", city:"San Francisco")
    category = Category.create(title:"Childcare")
    job = Job.create(title:"Babysitter", level_of_interest: 0, description:"Herd cats", company: company, category: category)
    contact = Contact.new(name:"Danny Tanner", email:"dan@fullhouse.com")

    visit company_path(company)
    click_button "New Contact"
    fill_in "contact[name]", with: contact.name
    fill_in "contact[email]", with: contact.email
    click_button "Create Contact"

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.email)
  end
end
