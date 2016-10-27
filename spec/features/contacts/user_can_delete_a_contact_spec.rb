require "rails_helper"

describe 'User can edit a contact' do
  scenario 'user can edit a contact' do
    company = Company.create(name:"Full House", city:"San Francisco")
    contact = Contact.create(name:"Danny Tanner", email:"dan@fullhouse.com", company: company)

    visit company_path(company)
    click_link "Delete Contact"

    expect(page).to_not have_content(contact.name)
    expect(page).to_not have_content(contact.email)
  end
end
