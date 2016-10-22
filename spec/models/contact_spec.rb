require 'rails_helper'

describe Contact, type: :model do
  let(:company) {Company.create(name:"The place to be", city:"San Francisco")}

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(email:"dannytanner@fullhouse.com", company: company)
        expect(contact).to be_invalid
      end
      it "is invalid without an email" do
        contact = Contact.new(name:"Danny Tanner", company: company)
        expect(contact).to be_invalid
      end
      it "has unique names" do
        contact1 = Contact.create(name:"Danny Tanner", email:"dannytanner@fullhouse.com", company: company)
        contact2 = Contact.new(name:"Danny Tanner", email:"dannytanner1@fullhouse.com", company: company)
        expect(contact2).to be_invalid
      end
      it "has unique emails" do
        contact1 = Contact.create(name:"Danny Tanner", email:"dannytanner@fullhouse.com", company: company)
        contact2 = Contact.new(name:"Daniel Tanner", email:"dannytanner@fullhouse.com", company: company)
        expect(contact2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and email" do
        contact = Contact.new(name:"Danny Tanner", email:"dannytanner@fullhouse.com", company: company)
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name:"Danny Tanner", email:"dannytanner@fullhouse.com", company: company)
      expect(contact).to respond_to(:company)
    end
  end
end
