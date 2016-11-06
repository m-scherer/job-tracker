Contact.delete_all
Comment.delete_all
Job.delete_all
Company.delete_all
Category.delete_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Finance", "Software", "Healthcare", "Marketing", "Sales", "Operations", "Professional Services"]

CATEGORIES.each do |category|
  Category.create!(title: category)
end
COMPANIES.each do |name|
  company = Company.create!(name: name, city: CITIES.sample)
  10.times do |num|
    category = Category.all.sample
    company.jobs.create!(title: JOBS.sample, category: category, description: "What a great position!", level_of_interest: num + rand(100))
  end
end
