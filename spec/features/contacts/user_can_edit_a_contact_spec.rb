require "rails_helper"

describe 'User can edit a contact' do
  scenario 'user can edit a contact' do
    company = Company.create(name:"Full House", city:"San Francisco")
    contact = Contact.create(name:"Danny Tanner", email:"dan@fullhouse.com", company: company)
    new_contact = Contact.new(name:"Michelle Tanner", email:"michelle@fullhouse.com")

    visit company_path(company)
    click_link "Edit Contact"
    fill_in "contact[name]", with: new_contact.name
    fill_in "contact[email]", with: new_contact.email
    click_button "Update Contact"

    expect(page).to have_content(new_contact.name)
    expect(page).to have_content(new_contact.email)
  end
end
