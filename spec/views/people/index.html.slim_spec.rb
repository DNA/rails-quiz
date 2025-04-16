require "rails_helper"

describe "people/index.html.slim" do
  before do
    15.times.map do |i|
      Person.create!(name: "Person #{i}", phone_number: i, email: "person#{i}@example.com")
    end

    @people = Person.includes(:company).all.page
  end

  it "Displays the users" do
    render template: "people/index", locals: { people: @people }

    expect(rendered).to have_css("h2", text: "Viewing people")
    expect(rendered).to have_css("tr", count: 11)
    expect(rendered).to have_css("ul.pagination")
    expect(rendered).to have_css("a.page-link", text: 2)
  end
end
