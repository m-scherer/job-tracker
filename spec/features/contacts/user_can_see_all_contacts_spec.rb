require 'rails_helper'

describe 'User can see all contacts' do
  scenario 'user sees all contacts' do
    company = Company.create(name:"Full House", city:"San Francisco")
    contact1 = Contact.create(name:"Danny Tanner", email:"dan@fullhouse.com", company: company)
    contact2 = Contact.create(name:"DJ Tanner", email:"dj@fullhouse.com", company: company)

    visit company_path(company)

    expect(page).to have_content(contact1.name)
    expect(page).to have_content(contact1.email)
    expect(page).to have_content(contact2.name)
    expect(page).to have_content(contact2.email)

  end
end
