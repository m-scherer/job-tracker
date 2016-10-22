require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 40)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe "level of interest methods" do
    it "groups all levels of interest" do
      job1 = Job.create(title: "Software", level_of_interest: 70, description: "Wahooo")
      job2 = Job.create(title: "Engineering", level_of_interest: 70, description: "Wahooo")
      job3 = Job.create(title: "Childcare", level_of_interest: 80, description: "Wahooo")
      expected = {70=>2, 80=>1}
      expect(Job.count_level_of_interest).to eq(expected)
    end
    it "calculates an average" do
      company1 = Company.create(name: "The place", city:"here")
      job1 = Job.create(title: "Software", level_of_interest: 100, description: "Wahooo", company: company1)
      job2 = Job.create(title: "Engineering", level_of_interest: 0, description: "Wahooo", company: company1)
      expected = {company1.name=>50}

      expect(Job.get_average_interest).to eq(expected)
    end
    it "returns top three companies by average interest" do
      company1 = Company.create(name: "The place", city:"Here")
      company2 = Company.create(name: "to be", city:"Here")
      company3 = Company.create(name: "is here", city:"Here")
      company4 = Company.create(name: "not here", city:"Here")
      job1 = Job.create(title: "Software", level_of_interest: 100, description: "Wahooo", company: company1)
      job2 = Job.create(title: "Engineering", level_of_interest: 90, description: "Wahooo", company: company2)
      job3 = Job.create(title: "Childcare", level_of_interest: 80, description: "Wahooo", company: company3)
      job4 = Job.create(title: "Healthcare", level_of_interest: 1, description: "Wahooo", company: company4)
      expected = [[company1.name, 100.0], [company2.name, 90.0], [company3.name, 80.0]]

      expect(Job.sorted_average_interest[0..2]).to eq(expected)
    end
  end

end
